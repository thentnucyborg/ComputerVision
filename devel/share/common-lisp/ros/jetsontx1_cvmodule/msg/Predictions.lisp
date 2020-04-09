; Auto-generated. Do not edit!


(cl:in-package jetsontx1_cvmodule-msg)


;//! \htmlinclude Predictions.msg.html

(cl:defclass <Predictions> (roslisp-msg-protocol:ros-message)
  ((predictions
    :reader predictions
    :initarg :predictions
    :type (cl:vector jetsontx1_cvmodule-msg:Prediction)
   :initform (cl:make-array 0 :element-type 'jetsontx1_cvmodule-msg:Prediction :initial-element (cl:make-instance 'jetsontx1_cvmodule-msg:Prediction))))
)

(cl:defclass Predictions (<Predictions>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Predictions>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Predictions)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name jetsontx1_cvmodule-msg:<Predictions> is deprecated: use jetsontx1_cvmodule-msg:Predictions instead.")))

(cl:ensure-generic-function 'predictions-val :lambda-list '(m))
(cl:defmethod predictions-val ((m <Predictions>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jetsontx1_cvmodule-msg:predictions-val is deprecated.  Use jetsontx1_cvmodule-msg:predictions instead.")
  (predictions m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Predictions>) ostream)
  "Serializes a message object of type '<Predictions>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'predictions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'predictions))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Predictions>) istream)
  "Deserializes a message object of type '<Predictions>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'predictions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'predictions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'jetsontx1_cvmodule-msg:Prediction))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Predictions>)))
  "Returns string type for a message object of type '<Predictions>"
  "jetsontx1_cvmodule/Predictions")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Predictions)))
  "Returns string type for a message object of type 'Predictions"
  "jetsontx1_cvmodule/Predictions")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Predictions>)))
  "Returns md5sum for a message object of type '<Predictions>"
  "0b45dcbc5bd1bad5797a52e2bd6b48de")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Predictions)))
  "Returns md5sum for a message object of type 'Predictions"
  "0b45dcbc5bd1bad5797a52e2bd6b48de")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Predictions>)))
  "Returns full string definition for message of type '<Predictions>"
  (cl:format cl:nil "Prediction[] predictions~%~%================================================================================~%MSG: jetsontx1_cvmodule/Prediction~%string[] classes~%float64[] probabilities~%int64 xmin~%int64 ymin~%int64 xmax~%int64 ymax~%int64 id~%string face~%string smile~%float64 distance~%float64 angle~%float64 xcoord~%float64 ycoord~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Predictions)))
  "Returns full string definition for message of type 'Predictions"
  (cl:format cl:nil "Prediction[] predictions~%~%================================================================================~%MSG: jetsontx1_cvmodule/Prediction~%string[] classes~%float64[] probabilities~%int64 xmin~%int64 ymin~%int64 xmax~%int64 ymax~%int64 id~%string face~%string smile~%float64 distance~%float64 angle~%float64 xcoord~%float64 ycoord~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Predictions>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'predictions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Predictions>))
  "Converts a ROS message object to a list"
  (cl:list 'Predictions
    (cl:cons ':predictions (predictions msg))
))
