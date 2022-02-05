#include <ros/ros.h>
#include <grid_map_ros/grid_map_ros.hpp>
#include <grid_map_msgs/GridMap.h>
#include <tf/transform_listener.h>
#include <nav_msgs/GetMap.h>
#include <nav_msgs/OccupancyGrid.h>
#include <cmath>
#include <std_srvs/Empty.h>

using namespace grid_map;

GridMap o_map({"occupancy", "energy", "visual"});

//Bresenham's line algorithm for ray tracing.
void iterate_visual_line(GridMap &map, const Position pos, double angle, double max_range){
  Index start, end;
  Position start_pos, end_pos;
  
  map.getIndex(pos, start);
  start_pos = map.getClosestPositionInMap(pos);
  end_pos.x() = start_pos.x() + max_range * cos(angle);
  end_pos.y() = start_pos.y() + max_range * sin(angle);
  map.getIndex(end_pos, end);
  
  for (grid_map::LineIterator iterator(map, start, end);
      !iterator.isPastEnd(); ++iterator) {
    if(map.at("occupancy", *iterator) < 1.0){
      map.at("visual", *iterator) = 1.0;
    }
    else{
      break;
    }
  }
}

//Reduces the map dimensions to only the rectangle encompassing the explored grids. 
GridMap get_minimal_map_from_occupancy(nav_msgs::OccupancyGrid &occupancyGrid){
  GridMap map({"occupancy", "energy", "visual"});
  GridMapRosConverter::fromOccupancyGrid(occupancyGrid,"occupancy", map);
  //Find the rectangle encompassing all valid grids
  int min_x = map.getSize().x();
  int min_y = map.getSize().y();
  int max_x = 0;
  int max_y = 0;
  Matrix& data = map["occupancy"];
  for (GridMapIterator iterator(map); !iterator.isPastEnd(); ++iterator) {
    const Index index(*iterator);
    if(!isnan(data(index(0), index(1)))) { // The index is defined
      if(index(0)<min_x){
        min_x = index(0);
      }
      if (index(0)>max_x)
      {
        max_x = index(0);
      }
      if(index(1)<min_y){
        min_y = index(1);
      } 
      if (index(1)>max_y){
        max_y = index(1);
      }
    }
  }
  Index center_index(min_x + (max_x-min_x)/2, min_y + (max_y-min_y)/2);
  Position center_pos;
  map.getPosition(center_index, center_pos);
  bool subMapIsSuccess;
  Length sub_length(map.getResolution()*(max_x-min_x), map.getResolution()*(max_y-min_y));
  ROS_INFO("Center position: %f,%f", center_pos.x(), center_pos.y());
  GridMap sub_map = map.getSubmap(center_pos, sub_length, subMapIsSuccess);	
  ROS_INFO("SubMap succes: %d", subMapIsSuccess);
  return sub_map;
}


bool reset_uv(std_srvs::Empty::Request& request, std_srvs::Empty::Response& response){
  o_map["energy"].setConstant(0.0);
  ROS_INFO("Cleared UV");
  return true;
}

void publish_observation_maps(GridMap map, Position robot_pos, double yaw, ros::Publisher pub){
  //Fill MultiArray with 2 pixel maps, occupancy+robot pos and energy respectivly
  //multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
  int map_size = map.getSize().y()*map.getSize().x();

  std_msgs::Float32MultiArray maps;
  maps.layout.dim.push_back(std_msgs::MultiArrayDimension());
  maps.layout.dim.push_back(std_msgs::MultiArrayDimension());
  maps.layout.dim.push_back(std_msgs::MultiArrayDimension());
  
  int channels = 2;

  int stride0 = map.getSize().y()*map.getSize().x()*channels;
  int stride1 = map.getSize().x()*channels;
  int stride2 = channels;

  maps.layout.dim[0].label = "height";
  maps.layout.dim[1].label = "width";
  maps.layout.dim[2].label = "channel";
  maps.layout.dim[0].size = map.getSize().y();
  maps.layout.dim[1].size = map.getSize().x();
  maps.layout.dim[2].size = channels; 
  maps.layout.dim[0].stride = stride0;
  maps.layout.dim[1].stride = stride1;
  maps.layout.dim[2].stride = stride2;
  maps.data.resize(map_size*channels);
  maps.layout.data_offset = 0;

  //Fill maps
  for (GridMapIterator iterator(map); !iterator.isPastEnd(); ++iterator) {
    const Index index(*iterator);
    
    if (!isnan(map.at("occupancy", *iterator))){
      maps.data[stride1*index(1)+stride2*index(0)+0]=map.at("occupancy", *iterator);
    } else {
      maps.data[stride1*index(1)+stride2*index(0)+0] = 100.0;
    }
    maps.data[stride1*index(1)+stride2*index(0)+1]=map.at("energy", *iterator);
  }
  
  //Add robot pos and yaw
  Index robot_index;
  map.getIndex(robot_pos, robot_index);
  maps.data[stride1*robot_index(0)+stride2*robot_index(1)+0]= (M_PI +yaw)*10;//Positive values, scaled to get more resolution when converting to uint8

  pub.publish(maps);
}
int main(int argc, char** argv)
{
  // Initialize node and publisher.
  ros::init(argc, argv, "uvc_grid_map");
  //Start service to reset energy
  ros::NodeHandle n;
  ros::ServiceServer reset_uv_service = n.advertiseService("reset_uv", reset_uv);
  ros::spinOnce();


  ros::NodeHandle nh("~");
  ros::Publisher publisher = nh.advertise<grid_map_msgs::GridMap>("grid_map", 1000, true);  

  // Get occupancy map from map_server, create layers
  ros::ServiceClient client = n.serviceClient<nav_msgs::GetMap>("static_map");
  nav_msgs::GetMap srv;
  
  if (client.call(srv)){
    ROS_INFO("Got map, resoltion:%f", srv.response.map.info.resolution);
    o_map = get_minimal_map_from_occupancy(srv.response.map);
    ROS_INFO("New map size: %f, %f", o_map.getLength().x(), o_map.getLength().y());
    }
  else{
    ROS_ERROR("Failed to get map");
    }
  o_map.setFrameId("map");
  o_map["energy"].setConstant(0.0);
  

  // Setup tf listener to get robot position
  tf::TransformListener listener;
  tf::StampedTransform transform;

  //Setup publisher of robot pos
  ros::NodeHandle nh2;
  ros::Publisher pos_publisher = nh2.advertise<std_msgs::Float32MultiArray>("maps", 100, true);

  // Work with grid map in a loop.
  double sampling_rate = 5.0;
  double sampling_time = 1/sampling_rate;
  ros::Rate rate(sampling_rate);
  while (nh.ok()) {
    

    ros::Time time = ros::Time::now();
    
    //Get the robot position in the map
    try{
      listener.waitForTransform("odom", "base_footprint", ros::Time(0), ros::Duration(2.0) );
      listener.lookupTransform("odom","base_footprint",ros::Time(0), transform);
    }
    catch(tf::TransformException &ex){
      ROS_ERROR("%s",ex.what());

      ros::spinOnce(); // Need to let service run, could otherwise cause deadlock

      ros::Duration(0.2).sleep();
      continue;
    }
    Position robot_pos(transform.getOrigin().x(),transform.getOrigin().y());
    tf::Quaternion q = transform.getRotation(); 
    double yaw = tf::getYaw(q);
    //Publish maps with robot position, occupancy and UVC energy(For RL)
    publish_observation_maps(o_map, robot_pos, yaw, pos_publisher);
    
    //Update visual line of sight layer
    double vision_meters = 3.0;
    o_map.clear("visual");
    int angle_increments =600;
    for(int i = 0; i<angle_increments; i++){
      double angle = i*2*M_PI/angle_increments;
      iterate_visual_line(o_map, robot_pos, angle, vision_meters);
    }
    //Iterate through cells within a radius, accumulate UVC energy
    double energy_radius = vision_meters; 
    double uvc_power = 0.1; //mW 
    for (CircleIterator iterator(o_map, robot_pos, energy_radius);
      !iterator.isPastEnd(); ++iterator) {
        Position grid_pos;
        o_map.getPosition(*iterator, grid_pos);
        double dist = sqrt(pow(grid_pos.x()-robot_pos.x(),2) + pow(grid_pos.y()-robot_pos.y(),2));
        if(dist>0.1 && o_map.at("visual", *iterator) > 0){
          o_map.at("energy", *iterator) += uvc_power*sampling_time/pow(dist,2);
        }
      }

    o_map.setTimestamp(time.toNSec());
    grid_map_msgs::GridMap message;
    GridMapRosConverter::toMessage(o_map, message);
    
    publisher.publish(message);
    
    //ROS_INFO_THROTTLE(3, "UVC Energy Grid map (timestamp %f) published.", message.info.header.stamp.toSec());
    // Wait for next cycle.
    ros::spinOnce(); // To allow the service server to run
    rate.sleep();
  }

  return 0;
}
