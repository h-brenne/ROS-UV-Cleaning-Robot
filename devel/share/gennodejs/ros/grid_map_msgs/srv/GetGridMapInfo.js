// Auto-generated. Do not edit!

// (in-package grid_map_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let GridMapInfo = require('../msg/GridMapInfo.js');

//-----------------------------------------------------------

class GetGridMapInfoRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetGridMapInfoRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetGridMapInfoRequest
    let len;
    let data = new GetGridMapInfoRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grid_map_msgs/GetGridMapInfoRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetGridMapInfoRequest(null);
    return resolved;
    }
};

class GetGridMapInfoResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.info = null;
    }
    else {
      if (initObj.hasOwnProperty('info')) {
        this.info = initObj.info
      }
      else {
        this.info = new GridMapInfo();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetGridMapInfoResponse
    // Serialize message field [info]
    bufferOffset = GridMapInfo.serialize(obj.info, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetGridMapInfoResponse
    let len;
    let data = new GetGridMapInfoResponse(null);
    // Deserialize message field [info]
    data.info = GridMapInfo.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += GridMapInfo.getMessageSize(object.info);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grid_map_msgs/GetGridMapInfoResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a0be1719725f7fd7b490db4d64321ff2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetGridMapInfoResponse(null);
    if (msg.info !== undefined) {
      resolved.info = GridMapInfo.Resolve(msg.info)
    }
    else {
      resolved.info = new GridMapInfo()
    }

    return resolved;
    }
};

module.exports = {
  Request: GetGridMapInfoRequest,
  Response: GetGridMapInfoResponse,
  md5sum() { return 'a0be1719725f7fd7b490db4d64321ff2'; },
  datatype() { return 'grid_map_msgs/GetGridMapInfo'; }
};
