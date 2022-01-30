#!/usr/bin/env python
import roslib
import rospy
import sys

import tf
import geometry_msgs.msg
import pickle
   
if __name__ == '__main__':
    rospy.init_node('map_tf_broadcaster')

    myargv = rospy.myargv(argv=sys.argv)
    if len(myargv)!=2:
        rospy.logerr("Usage: broadcastMaptf.py map_tf_name")
        quit()
    file_name = myargv[1]
    file_name += ".pkl"

    with open(file_name, 'rb') as p_in:
        pose = pickle.load(p_in)
    rospy.loginfo(pose)
    br = tf.TransformBroadcaster()

    rate = rospy.Rate(30.0)
    while not rospy.is_shutdown():
        rospy.loginfo(rospy.Time.now())
        br.sendTransform(pose[0],pose[1], rospy.Time.now(), "odom", "map")
        rate.sleep()