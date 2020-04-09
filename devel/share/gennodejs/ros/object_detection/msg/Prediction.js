// Auto-generated. Do not edit!

// (in-package object_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Prediction {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.classes = null;
      this.probabilities = null;
      this.xmin = null;
      this.ymin = null;
      this.xmax = null;
      this.ymax = null;
      this.distance = null;
      this.angle = null;
      this.xcoord = null;
      this.ycoord = null;
    }
    else {
      if (initObj.hasOwnProperty('classes')) {
        this.classes = initObj.classes
      }
      else {
        this.classes = [];
      }
      if (initObj.hasOwnProperty('probabilities')) {
        this.probabilities = initObj.probabilities
      }
      else {
        this.probabilities = [];
      }
      if (initObj.hasOwnProperty('xmin')) {
        this.xmin = initObj.xmin
      }
      else {
        this.xmin = 0;
      }
      if (initObj.hasOwnProperty('ymin')) {
        this.ymin = initObj.ymin
      }
      else {
        this.ymin = 0;
      }
      if (initObj.hasOwnProperty('xmax')) {
        this.xmax = initObj.xmax
      }
      else {
        this.xmax = 0;
      }
      if (initObj.hasOwnProperty('ymax')) {
        this.ymax = initObj.ymax
      }
      else {
        this.ymax = 0;
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
      if (initObj.hasOwnProperty('xcoord')) {
        this.xcoord = initObj.xcoord
      }
      else {
        this.xcoord = 0.0;
      }
      if (initObj.hasOwnProperty('ycoord')) {
        this.ycoord = initObj.ycoord
      }
      else {
        this.ycoord = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Prediction
    // Serialize message field [classes]
    bufferOffset = _arraySerializer.string(obj.classes, buffer, bufferOffset, null);
    // Serialize message field [probabilities]
    bufferOffset = _arraySerializer.float64(obj.probabilities, buffer, bufferOffset, null);
    // Serialize message field [xmin]
    bufferOffset = _serializer.int64(obj.xmin, buffer, bufferOffset);
    // Serialize message field [ymin]
    bufferOffset = _serializer.int64(obj.ymin, buffer, bufferOffset);
    // Serialize message field [xmax]
    bufferOffset = _serializer.int64(obj.xmax, buffer, bufferOffset);
    // Serialize message field [ymax]
    bufferOffset = _serializer.int64(obj.ymax, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = _serializer.float64(obj.distance, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.float64(obj.angle, buffer, bufferOffset);
    // Serialize message field [xcoord]
    bufferOffset = _serializer.float64(obj.xcoord, buffer, bufferOffset);
    // Serialize message field [ycoord]
    bufferOffset = _serializer.float64(obj.ycoord, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Prediction
    let len;
    let data = new Prediction(null);
    // Deserialize message field [classes]
    data.classes = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [probabilities]
    data.probabilities = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [xmin]
    data.xmin = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [ymin]
    data.ymin = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [xmax]
    data.xmax = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [ymax]
    data.ymax = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [xcoord]
    data.xcoord = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ycoord]
    data.ycoord = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.classes.forEach((val) => {
      length += 4 + val.length;
    });
    length += 8 * object.probabilities.length;
    return length + 72;
  }

  static datatype() {
    // Returns string type for a message object
    return 'object_detection/Prediction';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd88eff2e3e2eac200735b76da90deaa4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] classes
    float64[] probabilities
    int64 xmin
    int64 ymin
    int64 xmax
    int64 ymax
    float64 distance
    float64 angle
    float64 xcoord
    float64 ycoord
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Prediction(null);
    if (msg.classes !== undefined) {
      resolved.classes = msg.classes;
    }
    else {
      resolved.classes = []
    }

    if (msg.probabilities !== undefined) {
      resolved.probabilities = msg.probabilities;
    }
    else {
      resolved.probabilities = []
    }

    if (msg.xmin !== undefined) {
      resolved.xmin = msg.xmin;
    }
    else {
      resolved.xmin = 0
    }

    if (msg.ymin !== undefined) {
      resolved.ymin = msg.ymin;
    }
    else {
      resolved.ymin = 0
    }

    if (msg.xmax !== undefined) {
      resolved.xmax = msg.xmax;
    }
    else {
      resolved.xmax = 0
    }

    if (msg.ymax !== undefined) {
      resolved.ymax = msg.ymax;
    }
    else {
      resolved.ymax = 0
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    if (msg.xcoord !== undefined) {
      resolved.xcoord = msg.xcoord;
    }
    else {
      resolved.xcoord = 0.0
    }

    if (msg.ycoord !== undefined) {
      resolved.ycoord = msg.ycoord;
    }
    else {
      resolved.ycoord = 0.0
    }

    return resolved;
    }
};

module.exports = Prediction;
