;; Auto-generated. Do not edit!


(when (boundp 'jetsontx1_cvmodule::Predictions)
  (if (not (find-package "JETSONTX1_CVMODULE"))
    (make-package "JETSONTX1_CVMODULE"))
  (shadow 'Predictions (find-package "JETSONTX1_CVMODULE")))
(unless (find-package "JETSONTX1_CVMODULE::PREDICTIONS")
  (make-package "JETSONTX1_CVMODULE::PREDICTIONS"))

(in-package "ROS")
;;//! \htmlinclude Predictions.msg.html


(defclass jetsontx1_cvmodule::Predictions
  :super ros::object
  :slots (_predictions ))

(defmethod jetsontx1_cvmodule::Predictions
  (:init
   (&key
    ((:predictions __predictions) (let (r) (dotimes (i 0) (push (instance jetsontx1_cvmodule::Prediction :init) r)) r))
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
    ;; jetsontx1_cvmodule/Prediction[] _predictions
    (apply #'+ (send-all _predictions :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; jetsontx1_cvmodule/Prediction[] _predictions
     (write-long (length _predictions) s)
     (dolist (elem _predictions)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; jetsontx1_cvmodule/Prediction[] _predictions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _predictions (let (r) (dotimes (i n) (push (instance jetsontx1_cvmodule::Prediction :init) r)) r))
     (dolist (elem- _predictions)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get jetsontx1_cvmodule::Predictions :md5sum-) "0b45dcbc5bd1bad5797a52e2bd6b48de")
(setf (get jetsontx1_cvmodule::Predictions :datatype-) "jetsontx1_cvmodule/Predictions")
(setf (get jetsontx1_cvmodule::Predictions :definition-)
      "Prediction[] predictions

================================================================================
MSG: jetsontx1_cvmodule/Prediction
string[] classes
float64[] probabilities
int64 xmin
int64 ymin
int64 xmax
int64 ymax
int64 id
string face
string smile
float64 distance
float64 angle
float64 xcoord
float64 ycoord

")



(provide :jetsontx1_cvmodule/Predictions "0b45dcbc5bd1bad5797a52e2bd6b48de")


