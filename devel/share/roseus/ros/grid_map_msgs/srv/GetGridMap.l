;; Auto-generated. Do not edit!


(when (boundp 'grid_map_msgs::GetGridMap)
  (if (not (find-package "GRID_MAP_MSGS"))
    (make-package "GRID_MAP_MSGS"))
  (shadow 'GetGridMap (find-package "GRID_MAP_MSGS")))
(unless (find-package "GRID_MAP_MSGS::GETGRIDMAP")
  (make-package "GRID_MAP_MSGS::GETGRIDMAP"))
(unless (find-package "GRID_MAP_MSGS::GETGRIDMAPREQUEST")
  (make-package "GRID_MAP_MSGS::GETGRIDMAPREQUEST"))
(unless (find-package "GRID_MAP_MSGS::GETGRIDMAPRESPONSE")
  (make-package "GRID_MAP_MSGS::GETGRIDMAPRESPONSE"))

(in-package "ROS")





(defclass grid_map_msgs::GetGridMapRequest
  :super ros::object
  :slots (_frame_id _position_x _position_y _length_x _length_y _layers ))

(defmethod grid_map_msgs::GetGridMapRequest
  (:init
   (&key
    ((:frame_id __frame_id) "")
    ((:position_x __position_x) 0.0)
    ((:position_y __position_y) 0.0)
    ((:length_x __length_x) 0.0)
    ((:length_y __length_y) 0.0)
    ((:layers __layers) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _frame_id (string __frame_id))
   (setq _position_x (float __position_x))
   (setq _position_y (float __position_y))
   (setq _length_x (float __length_x))
   (setq _length_y (float __length_y))
   (setq _layers __layers)
   self)
  (:frame_id
   (&optional __frame_id)
   (if __frame_id (setq _frame_id __frame_id)) _frame_id)
  (:position_x
   (&optional __position_x)
   (if __position_x (setq _position_x __position_x)) _position_x)
  (:position_y
   (&optional __position_y)
   (if __position_y (setq _position_y __position_y)) _position_y)
  (:length_x
   (&optional __length_x)
   (if __length_x (setq _length_x __length_x)) _length_x)
  (:length_y
   (&optional __length_y)
   (if __length_y (setq _length_y __length_y)) _length_y)
  (:layers
   (&optional __layers)
   (if __layers (setq _layers __layers)) _layers)
  (:serialization-length
   ()
   (+
    ;; string _frame_id
    4 (length _frame_id)
    ;; float64 _position_x
    8
    ;; float64 _position_y
    8
    ;; float64 _length_x
    8
    ;; float64 _length_y
    8
    ;; string[] _layers
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _layers)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _frame_id
       (write-long (length _frame_id) s) (princ _frame_id s)
     ;; float64 _position_x
       (sys::poke _position_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_y
       (sys::poke _position_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _length_x
       (sys::poke _length_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _length_y
       (sys::poke _length_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string[] _layers
     (write-long (length _layers) s)
     (dolist (elem _layers)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _frame_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _frame_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _position_x
     (setq _position_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_y
     (setq _position_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _length_x
     (setq _length_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _length_y
     (setq _length_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string[] _layers
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _layers (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _layers i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass grid_map_msgs::GetGridMapResponse
  :super ros::object
  :slots (_map ))

(defmethod grid_map_msgs::GetGridMapResponse
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

(defclass grid_map_msgs::GetGridMap
  :super ros::object
  :slots ())

(setf (get grid_map_msgs::GetGridMap :md5sum-) "802c2cbc7b10fada2d44db75ddb8c738")
(setf (get grid_map_msgs::GetGridMap :datatype-) "grid_map_msgs/GetGridMap")
(setf (get grid_map_msgs::GetGridMap :request) grid_map_msgs::GetGridMapRequest)
(setf (get grid_map_msgs::GetGridMap :response) grid_map_msgs::GetGridMapResponse)

(defmethod grid_map_msgs::GetGridMapRequest
  (:response () (instance grid_map_msgs::GetGridMapResponse :init)))

(setf (get grid_map_msgs::GetGridMapRequest :md5sum-) "802c2cbc7b10fada2d44db75ddb8c738")
(setf (get grid_map_msgs::GetGridMapRequest :datatype-) "grid_map_msgs/GetGridMapRequest")
(setf (get grid_map_msgs::GetGridMapRequest :definition-)
      "# Frame id of the submap position request.
string frame_id

# Requested submap position in x-direction [m].
float64 position_x
  
# Requested submap position in y-direction [m].
float64 position_y

# Requested submap length in x-direction [m].
float64 length_x
  
# Requested submap width in y-direction [m].
float64 length_y

# Requested layers. If empty, get all layers.
string[] layers

---

# Submap
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
")

(setf (get grid_map_msgs::GetGridMapResponse :md5sum-) "802c2cbc7b10fada2d44db75ddb8c738")
(setf (get grid_map_msgs::GetGridMapResponse :datatype-) "grid_map_msgs/GetGridMapResponse")
(setf (get grid_map_msgs::GetGridMapResponse :definition-)
      "# Frame id of the submap position request.
string frame_id

# Requested submap position in x-direction [m].
float64 position_x
  
# Requested submap position in y-direction [m].
float64 position_y

# Requested submap length in x-direction [m].
float64 length_x
  
# Requested submap width in y-direction [m].
float64 length_y

# Requested layers. If empty, get all layers.
string[] layers

---

# Submap
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
")



(provide :grid_map_msgs/GetGridMap "802c2cbc7b10fada2d44db75ddb8c738")


