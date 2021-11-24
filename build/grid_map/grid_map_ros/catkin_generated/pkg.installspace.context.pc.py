# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;grid_map_core;grid_map_msgs;grid_map_cv;sensor_msgs;nav_msgs;std_msgs;geometry_msgs;cv_bridge;rosbag;tf;visualization_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lgrid_map_ros".split(';') if "-lgrid_map_ros" != "" else []
PROJECT_NAME = "grid_map_ros"
PROJECT_SPACE_DIR = "/home/havard/turtle_ws/install"
PROJECT_VERSION = "1.6.6"
