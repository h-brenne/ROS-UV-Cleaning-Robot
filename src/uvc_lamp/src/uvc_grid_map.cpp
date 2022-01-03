#include <ros/ros.h>
#include <grid_map_ros/grid_map_ros.hpp>
#include <grid_map_msgs/GridMap.h>
#include <tf/transform_listener.h>
#include <nav_msgs/GetMap.h>
#include <cmath>

using namespace grid_map;

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
int main(int argc, char** argv)
{
  // Initialize node and publisher.
  ros::init(argc, argv, "uvc_grid_map");
  ros::NodeHandle nh("~");
  ros::Publisher publisher = nh.advertise<grid_map_msgs::GridMap>("grid_map", 1, true);

  // Get occupancy map from map_server, create layers
  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<nav_msgs::GetMap>("static_map");
  nav_msgs::OccupancyGrid o_grid;
  nav_msgs::GetMap srv;
  GridMap o_map({"occupancy", "energy", "visual"});
  o_map.setFrameId("map");
  if (client.call(srv)){
    ROS_INFO("Got map, resoltion:%f", srv.response.map.info.resolution);
    GridMapRosConverter::fromOccupancyGrid(srv.response.map,"occupancy", o_map);
    }
  else{
    ROS_ERROR("Failed to get map");
    }
  o_map["energy"].setConstant(0.0);

  //Eigen::Array<int, 2, 1> z0(400,400);
  
  // Setup tf listener to get robot position
  tf::TransformListener listener;
  tf::StampedTransform transform;

  // Work with grid map in a loop.
  double sampling_rate = 10.0;
  double sampling_time = 1/sampling_rate;
  ros::Rate rate(sampling_rate);
  while (nh.ok()) {
    

    ros::Time time = ros::Time::now();
    
    //Get the robot position in the map
    try{
      listener.lookupTransform("/map","/base_link",ros::Time(0), transform);
    }
    catch(tf::TransformException &ex){
      ROS_ERROR("%s",ex.what());
      ros::Duration(1.0).sleep();
      continue;
    }
    Position robot_pos(transform.getOrigin().x(),transform.getOrigin().y());
    
    //Update visual line of sight layer
    o_map.clear("visual");
    int angle_increments = 800;
    for(int i = 0; i<angle_increments; i++){
      double angle = i*2*M_PI/angle_increments;
      iterate_visual_line(o_map, robot_pos, angle, 10.0);
    }
    
    //Iterate through cells within a radius, accumulate UVC energy
    double energy_radius = 3; 
    double uvc_power = 0.1; //mW 
    for (CircleIterator iterator(o_map, robot_pos, energy_radius);
      !iterator.isPastEnd(); ++iterator) {
        Position grid_pos;
        o_map.getPosition(*iterator, grid_pos);
        double dist = sqrt(pow(grid_pos.x()-robot_pos.x(),2) + pow(grid_pos.y()-robot_pos.y(),2));
        if(dist>0.1 && o_map.at("visual", *iterator) > 0){
          o_map.at("energy", *iterator) += uvc_power*sampling_time/pow(dist,2);
          //ROS_INFO("Power: %f, dist: %f",o_map.at("energy", *iterator), dist); 
        }
      }

    o_map.setTimestamp(time.toNSec());
    grid_map_msgs::GridMap message;
    GridMapRosConverter::toMessage(o_map, message);
    publisher.publish(message);
    //ROS_INFO_THROTTLE(3, "UVC Energy Grid map (timestamp %f) published.", message.info.header.stamp.toSec());
    // Wait for next cycle.
    rate.sleep();
  }

  return 0;
}
