; Auto-generated. Do not edit!


(cl:in-package jetsontx1_cvmodule-msg)


;//! \htmlinclude Peoplecount.msg.html

(cl:defclass <Peoplecount> (roslisp-msg-protocol:ros-message)
  ((tot_detected_people
    :reader tot_detected_people
    :initarg :tot_detected_people
    :type cl:integer
    :initform 0))
)

(cl:defclass Peoplecount (<Peoplecount>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Peoplecount>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Peoplecount)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name jetsontx1_cvmodule-msg:<Peoplecount> is deprecated: use jetsontx1_cvmodule-msg:Peoplecount instead.")))

(cl:ensure-generic-function 'tot_detected_people-val :lambda-list '(m))
(cl:defmethod tot_detected_people-val ((m <Peoplecount>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jetsontx1_cvmodule-msg:tot_detected_people-val is deprecated.  Use jetsontx1_cvmodule-msg:tot_detected_people instead.")
  (tot_detected_people m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Peoplecount>) ostream)
  "Serializes a message object of type '<Peoplecount>"
  (cl:let* ((signed (cl:slot-value msg 'tot_detected_people)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Peoplecount>) istream)
  "Deserializes a message object of type '<Peoplecount>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tot_detected_people) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Peoplecount>)))
  "Returns string type for a message object of type '<Peoplecount>"
  "jetsontx1_cvmodule/Peoplecount")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Peoplecount)))
  "Returns string type for a message object of type 'Peoplecount"
  "jetsontx1_cvmodule/Peoplecount")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Peoplecount>)))
  "Returns md5sum for a message object of type '<Peoplecount>"
  "71dd6017a25e8e7ae731854630c823b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Peoplecount)))
  "Returns md5sum for a message object of type 'Peoplecount"
  "71dd6017a25e8e7ae731854630c823b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Peoplecount>)))
  "Returns full string definition for message of type '<Peoplecount>"
  (cl:format cl:nil "int64 tot_detected_people~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Peoplecount)))
  "Returns full string definition for message of type 'Peoplecount"
  (cl:format cl:nil "int64 tot_detected_people~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Peoplecount>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Peoplecount>))
  "Converts a ROS message object to a list"
  (cl:list 'Peoplecount
    (cl:cons ':tot_detected_people (tot_detected_people msg))
))
