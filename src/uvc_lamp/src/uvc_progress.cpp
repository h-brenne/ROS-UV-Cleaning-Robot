#include <ros/ros.h>
#include <grid_map_ros/grid_map_ros.hpp>
#include <grid_map_msgs/GridMap.h>
#include <cmath>

#include <std_msgs/Float32.h>

bool first_run = true;
std::set<uint> free_indices; // Indices not occupied or unknown
ros::Publisher coverage_publisher;

void analyze_progress(grid_map::GridMap map, ros::Publisher pub){
  int covered_grids = 0;
  std_msgs::Float32MultiArray covered;
  //std_msgs::Int32 covered;

  /*occ_grid.info.width = map.getSize().x();
  occ_grid.info.height = map.getSize().y();
  occ_grid.info.resolution = map.getResolution();*/


  double average_energy = 0.0; //mW
  double covered_area = 0.0; // m^2
  double percentage_covered = 0.0;
  

  double coverage_threshold = 10.0; //mW 
  
  //Loop through all free indices
  grid_map::Matrix& energy_data = map["energy"];
  for (std::set<uint>::iterator iterator=free_indices.begin(); iterator != free_indices.end(); ++iterator) {
      grid_map::Index index = grid_map::getIndexFromLinearIndex(*iterator, map.getSize());
      int linear_index = grid_map::getLinearIndexFromIndex(index, map.getSize(), true); //Row major for Occ map
      average_energy += energy_data(index(0),index(1))/(double(free_indices.size()));
      if(energy_data(index(0),index(1)) > coverage_threshold){
            covered_grids++;
          }
    }

  covered_area = covered_grids*pow(map.getResolution(),2);
  percentage_covered = 100.0*covered_grids/free_indices.size();
  //pub.publish((float)percentage_covered);

  double total_area = free_indices.size()*pow(map.getResolution(),2);
  ROS_INFO_THROTTLE(10,"uvc_progress: Covered: %f %%, %f m^2 of %f m^2. Average energy: %f mW"
  , percentage_covered, covered_area, total_area, average_energy);
}

class SubscribeAndPublish
{
public:
  SubscribeAndPublish()
  {
    pub_ = n_.advertise<std_msgs::Float32>("covered", 10);;

    sub_ = n_.subscribe("/uvc_grid_map/grid_map", 1, &SubscribeAndPublish::sub_cb, this);
  }

  void sub_cb(const grid_map_msgs::GridMap& input)
  {
    grid_map::GridMap uvc_map;
    grid_map::GridMapRosConverter::fromMessage(input, uvc_map);
  
    if(first_run){
      first_run = false;
      ROS_INFO("uvc_progress: Got map! Size: %d,%d", uvc_map.getSize().x(), uvc_map.getSize().y());
      //Find free grids to be iterated in subsequent runs
      grid_map::Matrix& occ_data = uvc_map["occupancy"];
      for (grid_map::GridMapIterator iterator(uvc_map); !iterator.isPastEnd(); ++iterator) {
        const grid_map::Index index(*iterator);
        if (occ_data(index(0), index(1)) < 1.0){
          free_indices.insert(grid_map::getLinearIndexFromIndex(index, uvc_map.getSize()));
        }
      }
    ROS_INFO("Grids to cover: %ld", free_indices.size());
  }
  analyze_progress(uvc_map, pub_);
  }

private:
  ros::NodeHandle n_; 
  ros::Publisher pub_;
  ros::Subscriber sub_;

};

int main(int argc, char** argv)
{
  // Initialize node, publisher ans subscriber.
  ros::init(argc, argv, "uvc_progress");
  SubscribeAndPublish SAPObject;
  
  ros::spin();
}