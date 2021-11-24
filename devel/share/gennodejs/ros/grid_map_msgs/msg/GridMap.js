// Auto-generated. Do not edit!

// (in-package grid_map_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let GridMapInfo = require('./GridMapInfo.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class GridMap {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.info = null;
      this.layers = null;
      this.basic_layers = null;
      this.data = null;
      this.outer_start_index = null;
      this.inner_start_index = null;
    }
    else {
      if (initObj.hasOwnProperty('info')) {
        this.info = initObj.info
      }
      else {
        this.info = new GridMapInfo();
      }
      if (initObj.hasOwnProperty('layers')) {
        this.layers = initObj.layers
      }
      else {
        this.layers = [];
      }
      if (initObj.hasOwnProperty('basic_layers')) {
        this.basic_layers = initObj.basic_layers
      }
      else {
        this.basic_layers = [];
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
      if (initObj.hasOwnProperty('outer_start_index')) {
        this.outer_start_index = initObj.outer_start_index
      }
      else {
        this.outer_start_index = 0;
      }
      if (initObj.hasOwnProperty('inner_start_index')) {
        this.inner_start_index = initObj.inner_start_index
      }
      else {
        this.inner_start_index = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GridMap
    // Serialize message field [info]
    bufferOffset = GridMapInfo.serialize(obj.info, buffer, bufferOffset);
    // Serialize message field [layers]
    bufferOffset = _arraySerializer.string(obj.layers, buffer, bufferOffset, null);
    // Serialize message field [basic_layers]
    bufferOffset = _arraySerializer.string(obj.basic_layers, buffer, bufferOffset, null);
    // Serialize message field [data]
    // Serialize the length for message field [data]
    bufferOffset = _serializer.uint32(obj.data.length, buffer, bufferOffset);
    obj.data.forEach((val) => {
      bufferOffset = std_msgs.msg.Float32MultiArray.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [outer_start_index]
    bufferOffset = _serializer.uint16(obj.outer_start_index, buffer, bufferOffset);
    // Serialize message field [inner_start_index]
    bufferOffset = _serializer.uint16(obj.inner_start_index, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GridMap
    let len;
    let data = new GridMap(null);
    // Deserialize message field [info]
    data.info = GridMapInfo.deserialize(buffer, bufferOffset);
    // Deserialize message field [layers]
    data.layers = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [basic_layers]
    data.basic_layers = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [data]
    // Deserialize array length for message field [data]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.data = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.data[i] = std_msgs.msg.Float32MultiArray.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [outer_start_index]
    data.outer_start_index = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [inner_start_index]
    data.inner_start_index = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += GridMapInfo.getMessageSize(object.info);
    object.layers.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    object.basic_layers.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    object.data.forEach((val) => {
      length += std_msgs.msg.Float32MultiArray.getMessageSize(val);
    });
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'grid_map_msgs/GridMap';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '95681e052b1f73bf87b7eb984382b401';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    # dim[0].label  = "height"
    # dim[0].size   = 480
    # dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
    # dim[1].label  = "width"
    # dim[1].size   = 640
    # dim[1].stride = 3*640 = 1920
    # dim[2].label  = "channel"
    # dim[2].size   = 3
    # dim[2].stride = 3
    #
    # multiarray(i,j,k) refers to the ith row, jth column, and kth channel.
    
    ================================================================================
    MSG: std_msgs/MultiArrayDimension
    string label   # label of given dimension
    uint32 size    # size of given dimension (in type units)
    uint32 stride  # stride of given dimension
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GridMap(null);
    if (msg.info !== undefined) {
      resolved.info = GridMapInfo.Resolve(msg.info)
    }
    else {
      resolved.info = new GridMapInfo()
    }

    if (msg.layers !== undefined) {
      resolved.layers = msg.layers;
    }
    else {
      resolved.layers = []
    }

    if (msg.basic_layers !== undefined) {
      resolved.basic_layers = msg.basic_layers;
    }
    else {
      resolved.basic_layers = []
    }

    if (msg.data !== undefined) {
      resolved.data = new Array(msg.data.length);
      for (let i = 0; i < resolved.data.length; ++i) {
        resolved.data[i] = std_msgs.msg.Float32MultiArray.Resolve(msg.data[i]);
      }
    }
    else {
      resolved.data = []
    }

    if (msg.outer_start_index !== undefined) {
      resolved.outer_start_index = msg.outer_start_index;
    }
    else {
      resolved.outer_start_index = 0
    }

    if (msg.inner_start_index !== undefined) {
      resolved.inner_start_index = msg.inner_start_index;
    }
    else {
      resolved.inner_start_index = 0
    }

    return resolved;
    }
};

module.exports = GridMap;
