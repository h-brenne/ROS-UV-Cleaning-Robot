#include <ros/ros.h>
#include <grid_map_ros/grid_map_ros.hpp>
#include <grid_map_msgs/GridMap.h>
#include <cmath>

bool first_run = true;
std::set<uint> free_indices; // Indices not occupied or unknown

void analyze_progress(grid_map::GridMap map){
  int covered_grids = 0;
  double average_energy = 0.0; //mW
  double covered_area = 0.0; // m^2
  double percentage_covered = 0.0;
  

  double coverage_threshold = 10.0; //mW 
  grid_map::Matrix& energy_data = map["energy"];

  //Loop through all free indices
  for (std::set<uint>::iterator iterator=free_indices.begin(); iterator != free_indices.end(); ++iterator) {
      grid_map::Index index = grid_map::getIndexFromLinearIndex(*iterator, map.getSize());

      average_energy += energy_data(index(0),index(1))/(double(free_indices.size()));

      if(energy_data(index(0),index(1)) > coverage_threshold){
            covered_grids++;
          }
    }

  covered_area = covered_grids*pow(map.getResolution(),2);
  percentage_covered = 100.0*covered_grids/free_indices.size();

  double total_area = free_indices.size()*pow(map.getResolution(),2);
  ROS_INFO_THROTTLE(1,"uvc_progress: Covered: %f %%, %f m^2 of %f m^2. Average energy: %f mW"
  , percentage_covered, covered_area, total_area, average_energy);
}

void uvc_map_callback(const grid_map_msgs::GridMap& msg){
  grid_map::GridMap uvc_map;
  grid_map::GridMapRosConverter::fromMessage(msg, uvc_map);
  
  if(first_run){
    first_run = false;
    ROS_INFO("uvc_progress: Got map! Size: %d,%d", uvc_map.getSize().x(), uvc_map.getSize().x());
    //Find free grids to be iterated in subsequent runs
    grid_map::Matrix& occ_data = uvc_map["occupancy"];
    for (grid_map::GridMapIterator iterator(uvc_map); !iterator.isPastEnd(); ++iterator) {
      const grid_map::Index index(*iterator);
      if (occ_data(index(0), index(1)) < 1.0){
        free_indices.insert(grid_map::getLinearIndexFromIndex(index, uvc_map.getSize()));
      }
    }
  }
  analyze_progress(uvc_map);
}

int main(int argc, char** argv)
{
  // Initialize node and subscriber.
  ros::init(argc, argv, "uvc_progress");
  ros::NodeHandle nh;
  ros::Subscriber subscriber = nh.subscribe("/uvc_grid_map/grid_map", 100, uvc_map_callback);

  ros::spin();
}