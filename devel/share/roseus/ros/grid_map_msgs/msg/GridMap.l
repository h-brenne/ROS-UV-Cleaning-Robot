;; Auto-generated. Do not edit!


(when (boundp 'grid_map_msgs::GridMap)
  (if (not (find-package "GRID_MAP_MSGS"))
    (make-package "GRID_MAP_MSGS"))
  (shadow 'GridMap (find-package "GRID_MAP_MSGS")))
(unless (find-package "GRID_MAP_MSGS::GRIDMAP")
  (make-package "GRID_MAP_MSGS::GRIDMAP"))

(in-package "ROS")
;;//! \htmlinclude GridMap.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass grid_map_msgs::GridMap
  :super ros::object
  :slots (_info _layers _basic_layers _data _outer_start_index _inner_start_index ))

(defmethod grid_map_msgs::GridMap
  (:init
   (&key
    ((:info __info) (instance grid_map_msgs::GridMapInfo :init))
    ((:layers __layers) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:basic_layers __basic_layers) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:data __data) ())
    ((:outer_start_index __outer_start_index) 0)
    ((:inner_start_index __inner_start_index) 0)
    )
   (send-super :init)
   (setq _info __info)
   (setq _layers __layers)
   (setq _basic_layers __basic_layers)
   (setq _data __data)
   (setq _outer_start_index (round __outer_start_index))
   (setq _inner_start_index (round __inner_start_index))
   self)
  (:info
   (&rest __info)
   (if (keywordp (car __info))
       (send* _info __info)
     (progn
       (if __info (setq _info (car __info)))
       _info)))
  (:layers
   (&optional __layers)
   (if __layers (setq _layers __layers)) _layers)
  (:basic_layers
   (&optional __basic_layers)
   (if __basic_layers (setq _basic_layers __basic_layers)) _basic_layers)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:outer_start_index
   (&optional __outer_start_index)
   (if __outer_start_index (setq _outer_start_index __outer_start_index)) _outer_start_index)
  (:inner_start_index
   (&optional __inner_start_index)
   (if __inner_start_index (setq _inner_start_index __inner_start_index)) _inner_start_index)
  (:serialization-length
   ()
   (+
    ;; grid_map_msgs/GridMapInfo _info
    (send _info :serialization-length)
    ;; string[] _layers
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _layers)) 4
    ;; string[] _basic_layers
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _basic_layers)) 4
    ;; std_msgs/Float32MultiArray[] _data
    (apply #'+ (send-all _data :serialization-length)) 4
    ;; uint16 _outer_start_index
    2
    ;; uint16 _inner_start_index
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; grid_map_msgs/GridMapInfo _info
       (send _info :serialize s)
     ;; string[] _layers
     (write-long (length _layers) s)
     (dolist (elem _layers)
       (write-long (length elem) s) (princ elem s)
       )
     ;; string[] _basic_layers
     (write-long (length _basic_layers) s)
     (dolist (elem _basic_layers)
       (write-long (length elem) s) (princ elem s)
       )
     ;; std_msgs/Float32MultiArray[] _data
     (write-long (length _data) s)
     (dolist (elem _data)
       (send elem :serialize s)
       )
     ;; uint16 _outer_start_index
       (write-word _outer_start_index s)
     ;; uint16 _inner_start_index
       (write-word _inner_start_index s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; grid_map_msgs/GridMapInfo _info
     (send _info :deserialize buf ptr-) (incf ptr- (send _info :serialization-length))
   ;; string[] _layers
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _layers (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _layers i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; string[] _basic_layers
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _basic_layers (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _basic_layers i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; std_msgs/Float32MultiArray[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (let (r) (dotimes (i n) (push (instance std_msgs::Float32MultiArray :init) r)) r))
     (dolist (elem- _data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; uint16 _outer_start_index
     (setq _outer_start_index (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _inner_start_index
     (setq _inner_start_index (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get grid_map_msgs::GridMap :md5sum-) "95681e052b1f73bf87b7eb984382b401")
(setf (get grid_map_msgs::GridMap :datatype-) "grid_map_msgs/GridMap")
(setf (get grid_map_msgs::GridMap :definition-)
      "# Grid map header
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
uint32 stride  # stride of given dimension
")



(provide :grid_map_msgs/GridMap "95681e052b1f73bf87b7eb984382b401")


