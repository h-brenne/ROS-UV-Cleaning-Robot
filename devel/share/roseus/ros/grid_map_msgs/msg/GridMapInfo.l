;; Auto-generated. Do not edit!


(when (boundp 'grid_map_msgs::GridMapInfo)
  (if (not (find-package "GRID_MAP_MSGS"))
    (make-package "GRID_MAP_MSGS"))
  (shadow 'GridMapInfo (find-package "GRID_MAP_MSGS")))
(unless (find-package "GRID_MAP_MSGS::GRIDMAPINFO")
  (make-package "GRID_MAP_MSGS::GRIDMAPINFO"))

(in-package "ROS")
;;//! \htmlinclude GridMapInfo.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass grid_map_msgs::GridMapInfo
  :super ros::object
  :slots (_header _resolution _length_x _length_y _pose ))

(defmethod grid_map_msgs::GridMapInfo
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:resolution __resolution) 0.0)
    ((:length_x __length_x) 0.0)
    ((:length_y __length_y) 0.0)
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _resolution (float __resolution))
   (setq _length_x (float __length_x))
   (setq _length_y (float __length_y))
   (setq _pose __pose)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:resolution
   (&optional __resolution)
   (if __resolution (setq _resolution __resolution)) _resolution)
  (:length_x
   (&optional __length_x)
   (if __length_x (setq _length_x __length_x)) _length_x)
  (:length_y
   (&optional __length_y)
   (if __length_y (setq _length_y __length_y)) _length_y)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _resolution
    8
    ;; float64 _length_x
    8
    ;; float64 _length_y
    8
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _resolution
       (sys::poke _resolution (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _length_x
       (sys::poke _length_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _length_y
       (sys::poke _length_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _resolution
     (setq _resolution (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _length_x
     (setq _length_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _length_y
     (setq _length_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(setf (get grid_map_msgs::GridMapInfo :md5sum-) "43ee5430e1c253682111cb6bedac0ef9")
(setf (get grid_map_msgs::GridMapInfo :datatype-) "grid_map_msgs/GridMapInfo")
(setf (get grid_map_msgs::GridMapInfo :definition-)
      "# Header (time and frame)
Header header

# Resolution of the grid [m/cell].
float64 resolution

# Length in x-direction [m].
float64 length_x

# Length in y-direction [m].
float64 length_y

# Pose of the grid map center in the frame defined in `header` [m].
geometry_msgs/Pose pose
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :grid_map_msgs/GridMapInfo "43ee5430e1c253682111cb6bedac0ef9")


