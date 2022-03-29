#!/usr/bin/env python
import roslib
import rospy
import sys
import math

import tf
import geometry_msgs.msg
from nav_msgs.msg import Odometry
import pickle
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import Twist
from std_msgs.msg import Float32

curr_ang = 0
cmd_ang = 0
def get_odometry(odom):
    global curr_ang
    orientation = odom.pose.pose.orientation
    orientation_list = [orientation.x, orientation.y, orientation.z, orientation.w]
    _, _, curr_ang = euler_from_quaternion(orientation_list)

def get_cmd_ang(ang):
    global cmd_ang
    cmd_ang = ang.data

if __name__ == '__main__':
    rospy.init_node('angle_controller')

    listener = tf.TransformListener()
    sub_odom = rospy.Subscriber('odom', Odometry, get_odometry)
    sub_cmd_ang = rospy.Subscriber('cmd_ang', Float32, get_cmd_ang)
    pub_cmd_vel = rospy.Publisher('cmd_vel', Twist, queue_size=5)

    Kp = 3.0
    rate = rospy.Rate(5)
    while not rospy.is_shutdown():
        err = cmd_ang-curr_ang
        if err > math.pi:
            err -= 2*math.pi
        if err < -math.pi:
            err += 2*math.pi
        ang_vel = Kp*err

        vel_cmd = Twist()
        vel_cmd.linear.x = 0.2
        vel_cmd.angular.z = ang_vel
        pub_cmd_vel.publish(vel_cmd)