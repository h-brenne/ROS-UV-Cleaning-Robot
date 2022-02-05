#include <iostream>
#include <fstream>
#include <vector>
#include <actionlib/client/simple_action_client.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <ros/ros.h>
#include "geometry_msgs/PoseStamped.h"
#include "geometry_msgs/Point.h"
#include <ros/package.h>

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

void publish_goal(std::string filename){    
    std::fstream inFile(filename, std::ios::in);
    std::string line, word;
    std::vector <double> position;

    if(inFile.is_open()){
        while(getline(inFile, line)){
            std::stringstream str(line);
            while(getline(str, word, ' ')){
                if(word != "pos:"){
                    position.push_back(std::stod(word));
                }
            }
        }
    }
    else {
        ROS_INFO("Could not open file. Filename must be pos.txt, and you must provide only the path. Please check filepath and try again");
        throw "could not open file";
    }
    inFile.close();

    int n_pos = position.size()/7;
    for (int i = 0; i < n_pos; i++){
                
        geometry_msgs::Pose pose;
        pose.position.x = position[0 + (i*7)];
        pose.position.y = position[1 + (i*7)];
        pose.position.z = position[2 + (i*7)];

        pose.orientation.x = position[3 + (i*7)];
        pose.orientation.y = position[4 + (i*7)];
        pose.orientation.z = position[5 + (i*7)];
        pose.orientation.w = position[6 + (i*7)];

        MoveBaseClient ac("move_base", true);

        while(!ac.waitForServer(ros::Duration(5.0))){
            ROS_INFO("Waiting for move_base action server to come up");
        }

        move_base_msgs::MoveBaseGoal goal;

        goal.target_pose.header.frame_id = "map";
        goal.target_pose.header.stamp = ros::Time::now();
        goal.target_pose.pose = pose;

        ac.sendGoal(goal);
        ac.waitForResult();
    }   
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "cleaner_robot_nav_publisher");
    ros::NodeHandle nh("~");
    std::string param;
    nh.getParam("param", param);
    
    if(param.c_str() == ""){
        ROS_INFO("You need to provide a filepath as param. Write _param:=filepath");
    } else {
        publish_goal(param + "pos.txt");
    }
    return 0;
}
