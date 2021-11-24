;; Auto-generated. Do not edit!


(when (boundp 'grid_map_msgs::GetGridMapInfo)
  (if (not (find-package "GRID_MAP_MSGS"))
    (make-package "GRID_MAP_MSGS"))
  (shadow 'GetGridMapInfo (find-package "GRID_MAP_MSGS")))
(unless (find-package "GRID_MAP_MSGS::GETGRIDMAPINFO")
  (make-package "GRID_MAP_MSGS::GETGRIDMAPINFO"))
(unless (find-package "GRID_MAP_MSGS::GETGRIDMAPINFOREQUEST")
  (make-package "GRID_MAP_MSGS::GETGRIDMAPINFOREQUEST"))
(unless (find-package "GRID_MAP_MSGS::GETGRIDMAPINFORESPONSE")
  (make-package "GRID_MAP_MSGS::GETGRIDMAPINFORESPONSE"))

(in-package "ROS")





(defclass grid_map_msgs::GetGridMapInfoRequest
  :super ros::object
  :slots ())

(defmethod grid_map_msgs::GetGridMapInfoRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass grid_map_msgs::GetGridMapInfoResponse
  :super ros::object
  :slots (_info ))

(defmethod grid_map_msgs::GetGridMapInfoResponse
  (:init
   (&key
    ((:info __info) (instance grid_map_msgs::GridMapInfo :init))
    )
   (send-super :init)
   (setq _info __info)
   self)
  (:info
   (&rest __info)
   (if (keywordp (car __info))
       (send* _info __info)
     (progn
       (if __info (setq _info (car __info)))
       _info)))
  (:serialization-length
   ()
   (+
    ;; grid_map_msgs/GridMapInfo _info
    (send _info :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; grid_map_msgs/GridMapInfo _info
       (send _info :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; grid_map_msgs/GridMapInfo _info
     (send _info :deserialize buf ptr-) (incf ptr- (send _info :serialization-length))
   ;;
   self)
  )

(defclass grid_map_msgs::GetGridMapInfo
  :super ros::object
  :slots ())

(setf (get grid_map_msgs::GetGridMapInfo :md5sum-) "a0be1719725f7fd7b490db4d64321ff2")
(setf (get grid_map_msgs::GetGridMapInfo :datatype-) "grid_map_msgs/GetGridMapInfo")
(setf (get grid_map_msgs::GetGridMapInfo :request) grid_map_msgs::GetGridMapInfoRequest)
(setf (get grid_map_msgs::GetGridMapInfo :response) grid_map_msgs::GetGridMapInfoResponse)

(defmethod grid_map_msgs::GetGridMapInfoRequest
  (:response () (instance grid_map_msgs::GetGridMapInfoResponse :init)))

(setf (get grid_map_msgs::GetGridMapInfoRequest :md5sum-) "a0be1719725f7fd7b490db4d64321ff2")
(setf (get grid_map_msgs::GetGridMapInfoRequest :datatype-) "grid_map_msgs/GetGridMapInfoRequest")
(setf (get grid_map_msgs::GetGridMapInfoRequest :definition-)
      "---

# Grid map info
grid_map_msgs/GridMapInfo info


================================================================================
MSG: grid_map_msgs/GridMapInfo
# Header (time and frame)
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

(setf (get grid_map_msgs::GetGridMapInfoResponse :md5sum-) "a0be1719725f7fd7b490db4d64321ff2")
(setf (get grid_map_msgs::GetGridMapInfoResponse :datatype-) "grid_map_msgs/GetGridMapInfoResponse")
(setf (get grid_map_msgs::GetGridMapInfoResponse :definition-)
      "---

# Grid map info
grid_map_msgs/GridMapInfo info


================================================================================
MSG: grid_map_msgs/GridMapInfo
# Header (time and frame)
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



(provide :grid_map_msgs/GetGridMapInfo "a0be1719725f7fd7b490db4d64321ff2")


