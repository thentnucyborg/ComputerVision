;; Auto-generated. Do not edit!


(when (boundp 'jetsontx1_cvmodule::Peoplecount)
  (if (not (find-package "JETSONTX1_CVMODULE"))
    (make-package "JETSONTX1_CVMODULE"))
  (shadow 'Peoplecount (find-package "JETSONTX1_CVMODULE")))
(unless (find-package "JETSONTX1_CVMODULE::PEOPLECOUNT")
  (make-package "JETSONTX1_CVMODULE::PEOPLECOUNT"))

(in-package "ROS")
;;//! \htmlinclude Peoplecount.msg.html


(defclass jetsontx1_cvmodule::Peoplecount
  :super ros::object
  :slots (_tot_detected_people ))

(defmethod jetsontx1_cvmodule::Peoplecount
  (:init
   (&key
    ((:tot_detected_people __tot_detected_people) 0)
    )
   (send-super :init)
   (setq _tot_detected_people (round __tot_detected_people))
   self)
  (:tot_detected_people
   (&optional __tot_detected_people)
   (if __tot_detected_people (setq _tot_detected_people __tot_detected_people)) _tot_detected_people)
  (:serialization-length
   ()
   (+
    ;; int64 _tot_detected_people
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _tot_detected_people
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _tot_detected_people (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _tot_detected_people) (= (length (_tot_detected_people . bv)) 2)) ;; bignum
              (write-long (ash (elt (_tot_detected_people . bv) 0) 0) s)
              (write-long (ash (elt (_tot_detected_people . bv) 1) -1) s))
             ((and (class _tot_detected_people) (= (length (_tot_detected_people . bv)) 1)) ;; big1
              (write-long (elt (_tot_detected_people . bv) 0) s)
              (write-long (if (>= _tot_detected_people 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _tot_detected_people s)(write-long (if (>= _tot_detected_people 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _tot_detected_people
#+(or :alpha :irix6 :x86_64)
      (setf _tot_detected_people (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _tot_detected_people (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get jetsontx1_cvmodule::Peoplecount :md5sum-) "71dd6017a25e8e7ae731854630c823b1")
(setf (get jetsontx1_cvmodule::Peoplecount :datatype-) "jetsontx1_cvmodule/Peoplecount")
(setf (get jetsontx1_cvmodule::Peoplecount :definition-)
      "int64 tot_detected_people

")



(provide :jetsontx1_cvmodule/Peoplecount "71dd6017a25e8e7ae731854630c823b1")


