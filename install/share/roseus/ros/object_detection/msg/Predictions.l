;; Auto-generated. Do not edit!


(when (boundp 'object_detection::Predictions)
  (if (not (find-package "OBJECT_DETECTION"))
    (make-package "OBJECT_DETECTION"))
  (shadow 'Predictions (find-package "OBJECT_DETECTION")))
(unless (find-package "OBJECT_DETECTION::PREDICTIONS")
  (make-package "OBJECT_DETECTION::PREDICTIONS"))

(in-package "ROS")
;;//! \htmlinclude Predictions.msg.html


(defclass object_detection::Predictions
  :super ros::object
  :slots (_predictions ))

(defmethod object_detection::Predictions
  (:init
   (&key
    ((:predictions __predictions) (let (r) (dotimes (i 0) (push (instance object_detection::Prediction :init) r)) r))
    )
   (send-super :init)
   (setq _predictions __predictions)
   self)
  (:predictions
   (&rest __predictions)
   (if (keywordp (car __predictions))
       (send* _predictions __predictions)
     (progn
       (if __predictions (setq _predictions (car __predictions)))
       _predictions)))
  (:serialization-length
   ()
   (+
    ;; object_detection/Prediction[] _predictions
    (apply #'+ (send-all _predictions :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; object_detection/Prediction[] _predictions
     (write-long (length _predictions) s)
     (dolist (elem _predictions)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; object_detection/Prediction[] _predictions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _predictions (let (r) (dotimes (i n) (push (instance object_detection::Prediction :init) r)) r))
     (dolist (elem- _predictions)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get object_detection::Predictions :md5sum-) "8fe2bd78bcfaea922c71ab27bc03ae4c")
(setf (get object_detection::Predictions :datatype-) "object_detection/Predictions")
(setf (get object_detection::Predictions :definition-)
      "Prediction[] predictions

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

")



(provide :object_detection/Predictions "8fe2bd78bcfaea922c71ab27bc03ae4c")


