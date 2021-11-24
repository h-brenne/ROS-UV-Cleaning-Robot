;; Auto-generated. Do not edit!


(when (boundp 'grid_map_msgs::SetGridMap)
  (if (not (find-package "GRID_MAP_MSGS"))
    (make-package "GRID_MAP_MSGS"))
  (shadow 'SetGridMap (find-package "GRID_MAP_MSGS")))
(unless (find-package "GRID_MAP_MSGS::SETGRIDMAP")
  (make-package "GRID_MAP_MSGS::SETGRIDMAP"))
(unless (find-package "GRID_MAP_MSGS::SETGRIDMAPREQUEST")
  (make-package "GRID_MAP_MSGS::SETGRIDMAPREQUEST"))
(unless (find-package "GRID_MAP_MSGS::SETGRIDMAPRESPONSE")
  (make-package "GRID_MAP_MSGS::SETGRIDMAPRESPONSE"))

(in-package "ROS")





(defclass grid_map_msgs::SetGridMapRequest
  :super ros::object
  :slots (_map ))

(defmethod grid_map_msgs::SetGridMapRequest
  (:init
   (&key
    ((:map __map) (instance grid_map_msgs::GridMap :init))
    )
   (send-super :init)
   (setq _map __map)
   self)
  (:map
   (&rest __map)
   (if (keywordp (car __map))
       (send* _map __map)
     (progn
       (if __map (setq _map (car __map)))
       _map)))
  (:serialization-length
   ()
   (+
    ;; grid_map_msgs/GridMap _map
    (send _map :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; grid_map_msgs/GridMap _map
       (send _map :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; grid_map_msgs/GridMap _map
     (send _map :deserialize buf ptr-) (incf ptr- (send _map :serialization-length))
   ;;
   self)
  )

(defclass grid_map_msgs::SetGridMapResponse
  :super ros::object
  :slots ())

(defmethod grid_map_msgs::SetGridMapResponse
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

(defclass grid_map_msgs::SetGridMap
  :super ros::object
  :slots ())

(setf (get grid_map_msgs::SetGridMap :md5sum-) "4f8e24cfd42bc1470fe765b7516ff7e5")
(setf (get grid_map_msgs::SetGridMap :datatype-) "grid_map_msgs/SetGridMap")
(setf (get grid_map_msgs::SetGridMap :request) grid_map_msgs::SetGridMapRequest)
(setf (get grid_map_msgs::SetGridMap :response) grid_map_msgs::SetGridMapResponse)

(defmethod grid_map_msgs::SetGridMapRequest
  (:response () (instance grid_map_msgs::SetGridMapResponse :init)))

(setf (get grid_map_msgs::SetGridMapRequest :md5sum-) "4f8e24cfd42bc1470fe765b7516ff7e5")
(setf (get grid_map_msgs::SetGridMapRequest :datatype-) "grid_map_msgs/SetGridMapRequest")
(setf (get grid_map_msgs::SetGridMapRequest :definition-)
      "# map
grid_map_msgs/GridMap map


================================================================================
MSG: grid_map_msgs/GridMap
# Grid map header
GridMapInfo info

# Grid map layer names.
string[] layers

# Grid map basic layer names (optional). The basic layers
# determine which layers from `layers` need to be valid
# in order for a cell of the grid map to be valid.
string[] basic_layers

# Grid map data.
std_msgs/Float32MultiArray[] data

# Row start index (default 0).
uint16 outer_start_index

# Column start index (default 0).
uint16 inner_start_index

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

================================================================================
MSG: std_msgs/Float32MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
float32[]         data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
---

")

(setf (get grid_map_msgs::SetGridMapResponse :md5sum-) "4f8e24cfd42bc1470fe765b7516ff7e5")
(setf (get grid_map_msgs::SetGridMapResponse :datatype-) "grid_map_msgs/SetGridMapResponse")
(setf (get grid_map_msgs::SetGridMapResponse :definition-)
      "# map
grid_map_msgs/GridMap map


================================================================================
MSG: grid_map_msgs/GridMap
# Grid map header
GridMapInfo info

# Grid map layer names.
string[] layers

# Grid map basic layer names (optional). The basic layers
# determine which layers from `layers` need to be valid
# in order for a cell of the grid map to be valid.
string[] basic_layers

# Grid map data.
std_msgs/Float32MultiArray[] data

# Row start index (default 0).
uint16 outer_start_index

# Column start index (default 0).
uint16 inner_start_index

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

================================================================================
MSG: std_msgs/Float32MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
float32[]         data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
---

")



(provide :grid_map_msgs/SetGridMap "4f8e24cfd42bc1470fe765b7516ff7e5")


