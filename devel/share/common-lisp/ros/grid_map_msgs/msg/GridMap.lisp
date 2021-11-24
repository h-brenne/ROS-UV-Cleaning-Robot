; Auto-generated. Do not edit!


(cl:in-package grid_map_msgs-msg)


;//! \htmlinclude GridMap.msg.html

(cl:defclass <GridMap> (roslisp-msg-protocol:ros-message)
  ((info
    :reader info
    :initarg :info
    :type grid_map_msgs-msg:GridMapInfo
    :initform (cl:make-instance 'grid_map_msgs-msg:GridMapInfo))
   (layers
    :reader layers
    :initarg :layers
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (basic_layers
    :reader basic_layers
    :initarg :basic_layers
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (data
    :reader data
    :initarg :data
    :type (cl:vector std_msgs-msg:Float32MultiArray)
   :initform (cl:make-array 0 :element-type 'std_msgs-msg:Float32MultiArray :initial-element (cl:make-instance 'std_msgs-msg:Float32MultiArray)))
   (outer_start_index
    :reader outer_start_index
    :initarg :outer_start_index
    :type cl:fixnum
    :initform 0)
   (inner_start_index
    :reader inner_start_index
    :initarg :inner_start_index
    :type cl:fixnum
    :initform 0))
)

(cl:defclass GridMap (<GridMap>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GridMap>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GridMap)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grid_map_msgs-msg:<GridMap> is deprecated: use grid_map_msgs-msg:GridMap instead.")))

(cl:ensure-generic-function 'info-val :lambda-list '(m))
(cl:defmethod info-val ((m <GridMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grid_map_msgs-msg:info-val is deprecated.  Use grid_map_msgs-msg:info instead.")
  (info m))

(cl:ensure-generic-function 'layers-val :lambda-list '(m))
(cl:defmethod layers-val ((m <GridMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grid_map_msgs-msg:layers-val is deprecated.  Use grid_map_msgs-msg:layers instead.")
  (layers m))

(cl:ensure-generic-function 'basic_layers-val :lambda-list '(m))
(cl:defmethod basic_layers-val ((m <GridMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grid_map_msgs-msg:basic_layers-val is deprecated.  Use grid_map_msgs-msg:basic_layers instead.")
  (basic_layers m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <GridMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grid_map_msgs-msg:data-val is deprecated.  Use grid_map_msgs-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'outer_start_index-val :lambda-list '(m))
(cl:defmethod outer_start_index-val ((m <GridMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grid_map_msgs-msg:outer_start_index-val is deprecated.  Use grid_map_msgs-msg:outer_start_index instead.")
  (outer_start_index m))

(cl:ensure-generic-function 'inner_start_index-val :lambda-list '(m))
(cl:defmethod inner_start_index-val ((m <GridMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grid_map_msgs-msg:inner_start_index-val is deprecated.  Use grid_map_msgs-msg:inner_start_index instead.")
  (inner_start_index m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GridMap>) ostream)
  "Serializes a message object of type '<GridMap>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'info) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'layers))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'layers))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'basic_layers))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'basic_layers))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'data))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'outer_start_index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'outer_start_index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'inner_start_index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'inner_start_index)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GridMap>) istream)
  "Deserializes a message object of type '<GridMap>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'info) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'layers) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'layers)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'basic_layers) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'basic_layers)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'std_msgs-msg:Float32MultiArray))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'outer_start_index)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'outer_start_index)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'inner_start_index)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'inner_start_index)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GridMap>)))
  "Returns string type for a message object of type '<GridMap>"
  "grid_map_msgs/GridMap")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GridMap)))
  "Returns string type for a message object of type 'GridMap"
  "grid_map_msgs/GridMap")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GridMap>)))
  "Returns md5sum for a message object of type '<GridMap>"
  "95681e052b1f73bf87b7eb984382b401")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GridMap)))
  "Returns md5sum for a message object of type 'GridMap"
  "95681e052b1f73bf87b7eb984382b401")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GridMap>)))
  "Returns full string definition for message of type '<GridMap>"
  (cl:format cl:nil "# Grid map header~%GridMapInfo info~%~%# Grid map layer names.~%string[] layers~%~%# Grid map basic layer names (optional). The basic layers~%# determine which layers from `layers` need to be valid~%# in order for a cell of the grid map to be valid.~%string[] basic_layers~%~%# Grid map data.~%std_msgs/Float32MultiArray[] data~%~%# Row start index (default 0).~%uint16 outer_start_index~%~%# Column start index (default 0).~%uint16 inner_start_index~%~%================================================================================~%MSG: grid_map_msgs/GridMapInfo~%# Header (time and frame)~%Header header~%~%# Resolution of the grid [m/cell].~%float64 resolution~%~%# Length in x-direction [m].~%float64 length_x~%~%# Length in y-direction [m].~%float64 length_y~%~%# Pose of the grid map center in the frame defined in `header` [m].~%geometry_msgs/Pose pose~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: std_msgs/Float32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float32[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GridMap)))
  "Returns full string definition for message of type 'GridMap"
  (cl:format cl:nil "# Grid map header~%GridMapInfo info~%~%# Grid map layer names.~%string[] layers~%~%# Grid map basic layer names (optional). The basic layers~%# determine which layers from `layers` need to be valid~%# in order for a cell of the grid map to be valid.~%string[] basic_layers~%~%# Grid map data.~%std_msgs/Float32MultiArray[] data~%~%# Row start index (default 0).~%uint16 outer_start_index~%~%# Column start index (default 0).~%uint16 inner_start_index~%~%================================================================================~%MSG: grid_map_msgs/GridMapInfo~%# Header (time and frame)~%Header header~%~%# Resolution of the grid [m/cell].~%float64 resolution~%~%# Length in x-direction [m].~%float64 length_x~%~%# Length in y-direction [m].~%float64 length_y~%~%# Pose of the grid map center in the frame defined in `header` [m].~%geometry_msgs/Pose pose~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: std_msgs/Float32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float32[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GridMap>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'info))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'layers) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'basic_layers) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GridMap>))
  "Converts a ROS message object to a list"
  (cl:list 'GridMap
    (cl:cons ':info (info msg))
    (cl:cons ':layers (layers msg))
    (cl:cons ':basic_layers (basic_layers msg))
    (cl:cons ':data (data msg))
    (cl:cons ':outer_start_index (outer_start_index msg))
    (cl:cons ':inner_start_index (inner_start_index msg))
))
