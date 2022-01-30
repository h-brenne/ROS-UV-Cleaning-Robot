#!/usr/bin/env python
import roslib
import rospy
import sys

import tf
import geometry_msgs.msg
import pickle
   
if __name__ == '__main__':
    myargv = rospy.myargv(argv=sys.argv)
    if len(myargv)!=2:
        rospy.logerr("Usage: saveMaptf.py map_tf_filename")
        quit()
    file_name = myargv[1]
    file_name += ".pkl"
    rospy.init_node('turtle_tf_broadcaster')

    listener = tf.TransformListener()

    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        try:
            pose = listener.lookupTransform('/odom', '/map', rospy.Time(0))
        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            continue#!/usr/bin/env python
        with open(file_name, 'wb') as out:
            pickle.dump(pose, out, pickle.HIGHEST_PROTOCOL)
            rospy.loginfo_throttle(1,"Map transfromed saved, ctrl-c to exit")
    