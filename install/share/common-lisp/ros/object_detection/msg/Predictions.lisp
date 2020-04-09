; Auto-generated. Do not edit!


(cl:in-package object_detection-msg)


;//! \htmlinclude Predictions.msg.html

(cl:defclass <Predictions> (roslisp-msg-protocol:ros-message)
  ((predictions
    :reader predictions
    :initarg :predictions
    :type (cl:vector object_detection-msg:Prediction)
   :initform (cl:make-array 0 :element-type 'object_detection-msg:Prediction :initial-element (cl:make-instance 'object_detection-msg:Prediction))))
)

(cl:defclass Predictions (<Predictions>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Predictions>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Predictions)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name object_detection-msg:<Predictions> is deprecated: use object_detection-msg:Predictions instead.")))

(cl:ensure-generic-function 'predictions-val :lambda-list '(m))
(cl:defmethod predictions-val ((m <Predictions>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_detection-msg:predictions-val is deprecated.  Use object_detection-msg:predictions instead.")
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
    (cl:setf (cl:aref vals i) (cl:make-instance 'object_detection-msg:Prediction))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Predictions>)))
  "Returns string type for a message object of type '<Predictions>"
  "object_detection/Predictions")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Predictions)))
  "Returns string type for a message object of type 'Predictions"
  "object_detection/Predictions")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Predictions>)))
  "Returns md5sum for a message object of type '<Predictions>"
  "8fe2bd78bcfaea922c71ab27bc03ae4c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Predictions)))
  "Returns md5sum for a message object of type 'Predictions"
  "8fe2bd78bcfaea922c71ab27bc03ae4c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Predictions>)))
  "Returns full string definition for message of type '<Predictions>"
  (cl:format cl:nil "Prediction[] predictions~%~%================================================================================~%MSG: object_detection/Prediction~%string[] classes~%float64[] probabilities~%int64 xmin~%int64 ymin~%int64 xmax~%int64 ymax~%float64 distance~%float64 angle~%float64 xcoord~%float64 ycoord~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Predictions)))
  "Returns full string definition for message of type 'Predictions"
  (cl:format cl:nil "Prediction[] predictions~%~%================================================================================~%MSG: object_detection/Prediction~%string[] classes~%float64[] probabilities~%int64 xmin~%int64 ymin~%int64 xmax~%int64 ymax~%float64 distance~%float64 angle~%float64 xcoord~%float64 ycoord~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Predictions>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'predictions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Predictions>))
  "Converts a ROS message object to a list"
  (cl:list 'Predictions
    (cl:cons ':predictions (predictions msg))
))
