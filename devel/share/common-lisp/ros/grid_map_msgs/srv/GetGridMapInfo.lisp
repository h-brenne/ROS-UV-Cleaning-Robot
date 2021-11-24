; Auto-generated. Do not edit!


(cl:in-package grid_map_msgs-srv)


;//! \htmlinclude GetGridMapInfo-request.msg.html

(cl:defclass <GetGridMapInfo-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetGridMapInfo-request (<GetGridMapInfo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetGridMapInfo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetGridMapInfo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grid_map_msgs-srv:<GetGridMapInfo-request> is deprecated: use grid_map_msgs-srv:GetGridMapInfo-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetGridMapInfo-request>) ostream)
  "Serializes a message object of type '<GetGridMapInfo-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetGridMapInfo-request>) istream)
  "Deserializes a message object of type '<GetGridMapInfo-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetGridMapInfo-request>)))
  "Returns string type for a service object of type '<GetGridMapInfo-request>"
  "grid_map_msgs/GetGridMapInfoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetGridMapInfo-request)))
  "Returns string type for a service object of type 'GetGridMapInfo-request"
  "grid_map_msgs/GetGridMapInfoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetGridMapInfo-request>)))
  "Returns md5sum for a message object of type '<GetGridMapInfo-request>"
  "a0be1719725f7fd7b490db4d64321ff2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetGridMapInfo-request)))
  "Returns md5sum for a message object of type 'GetGridMapInfo-request"
  "a0be1719725f7fd7b490db4d64321ff2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetGridMapInfo-request>)))
  "Returns full string definition for message of type '<GetGridMapInfo-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetGridMapInfo-request)))
  "Returns full string definition for message of type 'GetGridMapInfo-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetGridMapInfo-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetGridMapInfo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetGridMapInfo-request
))
;//! \htmlinclude GetGridMapInfo-response.msg.html

(cl:defclass <GetGridMapInfo-response> (roslisp-msg-protocol:ros-message)
  ((info
    :reader info
    :initarg :info
    :type grid_map_msgs-msg:GridMapInfo
    :initform (cl:make-instance 'grid_map_msgs-msg:GridMapInfo)))
)

(cl:defclass GetGridMapInfo-response (<GetGridMapInfo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetGridMapInfo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetGridMapInfo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grid_map_msgs-srv:<GetGridMapInfo-response> is deprecated: use grid_map_msgs-srv:GetGridMapInfo-response instead.")))

(cl:ensure-generic-function 'info-val :lambda-list '(m))
(cl:defmethod info-val ((m <GetGridMapInfo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grid_map_msgs-srv:info-val is deprecated.  Use grid_map_msgs-srv:info instead.")
  (info m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetGridMapInfo-response>) ostream)
  "Serializes a message object of type '<GetGridMapInfo-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'info) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetGridMapInfo-response>) istream)
  "Deserializes a message object of type '<GetGridMapInfo-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'info) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetGridMapInfo-response>)))
  "Returns string type for a service object of type '<GetGridMapInfo-response>"
  "grid_map_msgs/GetGridMapInfoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetGridMapInfo-response)))
  "Returns string type for a service object of type 'GetGridMapInfo-response"
  "grid_map_msgs/GetGridMapInfoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetGridMapInfo-response>)))
  "Returns md5sum for a message object of type '<GetGridMapInfo-response>"
  "a0be1719725f7fd7b490db4d64321ff2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetGridMapInfo-response)))
  "Returns md5sum for a message object of type 'GetGridMapInfo-response"
  "a0be1719725f7fd7b490db4d64321ff2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetGridMapInfo-response>)))
  "Returns full string definition for message of type '<GetGridMapInfo-response>"
  (cl:format cl:nil "~%# Grid map info~%grid_map_msgs/GridMapInfo info~%~%~%================================================================================~%MSG: grid_map_msgs/GridMapInfo~%# Header (time and frame)~%Header header~%~%# Resolution of the grid [m/cell].~%float64 resolution~%~%# Length in x-direction [m].~%float64 length_x~%~%# Length in y-direction [m].~%float64 length_y~%~%# Pose of the grid map center in the frame defined in `header` [m].~%geometry_msgs/Pose pose~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetGridMapInfo-response)))
  "Returns full string definition for message of type 'GetGridMapInfo-response"
  (cl:format cl:nil "~%# Grid map info~%grid_map_msgs/GridMapInfo info~%~%~%================================================================================~%MSG: grid_map_msgs/GridMapInfo~%# Header (time and frame)~%Header header~%~%# Resolution of the grid [m/cell].~%float64 resolution~%~%# Length in x-direction [m].~%float64 length_x~%~%# Length in y-direction [m].~%float64 length_y~%~%# Pose of the grid map center in the frame defined in `header` [m].~%geometry_msgs/Pose pose~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetGridMapInfo-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'info))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetGridMapInfo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetGridMapInfo-response
    (cl:cons ':info (info msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetGridMapInfo)))
  'GetGridMapInfo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetGridMapInfo)))
  'GetGridMapInfo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetGridMapInfo)))
  "Returns string type for a service object of type '<GetGridMapInfo>"
  "grid_map_msgs/GetGridMapInfo")