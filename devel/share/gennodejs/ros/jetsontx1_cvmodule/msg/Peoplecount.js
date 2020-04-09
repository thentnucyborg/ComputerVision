// Auto-generated. Do not edit!

// (in-package jetsontx1_cvmodule.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Peoplecount {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tot_detected_people = null;
    }
    else {
      if (initObj.hasOwnProperty('tot_detected_people')) {
        this.tot_detected_people = initObj.tot_detected_people
      }
      else {
        this.tot_detected_people = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Peoplecount
    // Serialize message field [tot_detected_people]
    bufferOffset = _serializer.int64(obj.tot_detected_people, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Peoplecount
    let len;
    let data = new Peoplecount(null);
    // Deserialize message field [tot_detected_people]
    data.tot_detected_people = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'jetsontx1_cvmodule/Peoplecount';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '71dd6017a25e8e7ae731854630c823b1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 tot_detected_people
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Peoplecount(null);
    if (msg.tot_detected_people !== undefined) {
      resolved.tot_detected_people = msg.tot_detected_people;
    }
    else {
      resolved.tot_detected_people = 0
    }

    return resolved;
    }
};

module.exports = Peoplecount;
