; Auto-generated. Do not edit!


(cl:in-package grid_map_msgs-srv)


;//! \htmlinclude SetGridMap-request.msg.html

(cl:defclass <SetGridMap-request> (roslisp-msg-protocol:ros-message)
  ((map
    :reader map
    :initarg :map
    :type grid_map_msgs-msg:GridMap
    :initform (cl:make-instance 'grid_map_msgs-msg:GridMap)))
)

(cl:defclass SetGridMap-request (<SetGridMap-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetGridMap-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetGridMap-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grid_map_msgs-srv:<SetGridMap-request> is deprecated: use grid_map_msgs-srv:SetGridMap-request instead.")))

(cl:ensure-generic-function 'map-val :lambda-list '(m))
(cl:defmethod map-val ((m <SetGridMap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grid_map_msgs-srv:map-val is deprecated.  Use grid_map_msgs-srv:map instead.")
  (map m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetGridMap-request>) ostream)
  "Serializes a message object of type '<SetGridMap-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'map) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetGridMap-request>) istream)
  "Deserializes a message object of type '<SetGridMap-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'map) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetGridMap-request>)))
  "Returns string type for a service object of type '<SetGridMap-request>"
  "grid_map_msgs/SetGridMapRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetGridMap-request)))
  "Returns string type for a service object of type 'SetGridMap-request"
  "grid_map_msgs/SetGridMapRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetGridMap-request>)))
  "Returns md5sum for a message object of type '<SetGridMap-request>"
  "4f8e24cfd42bc1470fe765b7516ff7e5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetGridMap-request)))
  "Returns md5sum for a message object of type 'SetGridMap-request"
  "4f8e24cfd42bc1470fe765b7516ff7e5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetGridMap-request>)))
  "Returns full string definition for message of type '<SetGridMap-request>"
  (cl:format cl:nil "# map~%grid_map_msgs/GridMap map~%~%~%================================================================================~%MSG: grid_map_msgs/GridMap~%# Grid map header~%GridMapInfo info~%~%# Grid map layer names.~%string[] layers~%~%# Grid map basic layer names (optional). The basic layers~%# determine which layers from `layers` need to be valid~%# in order for a cell of the grid map to be valid.~%string[] basic_layers~%~%# Grid map data.~%std_msgs/Float32MultiArray[] data~%~%# Row start index (default 0).~%uint16 outer_start_index~%~%# Column start index (default 0).~%uint16 inner_start_index~%~%================================================================================~%MSG: grid_map_msgs/GridMapInfo~%# Header (time and frame)~%Header header~%~%# Resolution of the grid [m/cell].~%float64 resolution~%~%# Length in x-direction [m].~%float64 length_x~%~%# Length in y-direction [m].~%float64 length_y~%~%# Pose of the grid map center in the frame defined in `header` [m].~%geometry_msgs/Pose pose~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: std_msgs/Float32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float32[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetGridMap-request)))
  "Returns full string definition for message of type 'SetGridMap-request"
  (cl:format cl:nil "# map~%grid_map_msgs/GridMap map~%~%~%================================================================================~%MSG: grid_map_msgs/GridMap~%# Grid map header~%GridMapInfo info~%~%# Grid map layer names.~%string[] layers~%~%# Grid map basic layer names (optional). The basic layers~%# determine which layers from `layers` need to be valid~%# in order for a cell of the grid map to be valid.~%string[] basic_layers~%~%# Grid map data.~%std_msgs/Float32MultiArray[] data~%~%# Row start index (default 0).~%uint16 outer_start_index~%~%# Column start index (default 0).~%uint16 inner_start_index~%~%================================================================================~%MSG: grid_map_msgs/GridMapInfo~%# Header (time and frame)~%Header header~%~%# Resolution of the grid [m/cell].~%float64 resolution~%~%# Length in x-direction [m].~%float64 length_x~%~%# Length in y-direction [m].~%float64 length_y~%~%# Pose of the grid map center in the frame defined in `header` [m].~%geometry_msgs/Pose pose~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: std_msgs/Float32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float32[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetGridMap-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'map))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetGridMap-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetGridMap-request
    (cl:cons ':map (map msg))
))
;//! \htmlinclude SetGridMap-response.msg.html

(cl:defclass <SetGridMap-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetGridMap-response (<SetGridMap-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetGridMap-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetGridMap-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grid_map_msgs-srv:<SetGridMap-response> is deprecated: use grid_map_msgs-srv:SetGridMap-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetGridMap-response>) ostream)
  "Serializes a message object of type '<SetGridMap-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetGridMap-response>) istream)
  "Deserializes a message object of type '<SetGridMap-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetGridMap-response>)))
  "Returns string type for a service object of type '<SetGridMap-response>"
  "grid_map_msgs/SetGridMapResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetGridMap-response)))
  "Returns string type for a service object of type 'SetGridMap-response"
  "grid_map_msgs/SetGridMapResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetGridMap-response>)))
  "Returns md5sum for a message object of type '<SetGridMap-response>"
  "4f8e24cfd42bc1470fe765b7516ff7e5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetGridMap-response)))
  "Returns md5sum for a message object of type 'SetGridMap-response"
  "4f8e24cfd42bc1470fe765b7516ff7e5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetGridMap-response>)))
  "Returns full string definition for message of type '<SetGridMap-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetGridMap-response)))
  "Returns full string definition for message of type 'SetGridMap-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetGridMap-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetGridMap-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetGridMap-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetGridMap)))
  'SetGridMap-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetGridMap)))
  'SetGridMap-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetGridMap)))
  "Returns string type for a service object of type '<SetGridMap>"
  "grid_map_msgs/SetGridMap")