// Auto-generated. Do not edit!

// (in-package object_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Prediction = require('./Prediction.js');

//-----------------------------------------------------------

class Predictions {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.predictions = null;
    }
    else {
      if (initObj.hasOwnProperty('predictions')) {
        this.predictions = initObj.predictions
      }
      else {
        this.predictions = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Predictions
    // Serialize message field [predictions]
    // Serialize the length for message field [predictions]
    bufferOffset = _serializer.uint32(obj.predictions.length, buffer, bufferOffset);
    obj.predictions.forEach((val) => {
      bufferOffset = Prediction.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Predictions
    let len;
    let data = new Predictions(null);
    // Deserialize message field [predictions]
    // Deserialize array length for message field [predictions]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.predictions = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.predictions[i] = Prediction.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.predictions.forEach((val) => {
      length += Prediction.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'object_detection/Predictions';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8fe2bd78bcfaea922c71ab27bc03ae4c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Prediction[] predictions
    
    ================================================================================
    MSG: object_detection/Prediction
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
    const resolved = new Predictions(null);
    if (msg.predictions !== undefined) {
      resolved.predictions = new Array(msg.predictions.length);
      for (let i = 0; i < resolved.predictions.length; ++i) {
        resolved.predictions[i] = Prediction.Resolve(msg.predictions[i]);
      }
    }
    else {
      resolved.predictions = []
    }

    return resolved;
    }
};

module.exports = Predictions;
