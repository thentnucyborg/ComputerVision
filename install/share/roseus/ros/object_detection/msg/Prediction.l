;; Auto-generated. Do not edit!


(when (boundp 'object_detection::Prediction)
  (if (not (find-package "OBJECT_DETECTION"))
    (make-package "OBJECT_DETECTION"))
  (shadow 'Prediction (find-package "OBJECT_DETECTION")))
(unless (find-package "OBJECT_DETECTION::PREDICTION")
  (make-package "OBJECT_DETECTION::PREDICTION"))

(in-package "ROS")
;;//! \htmlinclude Prediction.msg.html


(defclass object_detection::Prediction
  :super ros::object
  :slots (_classes _probabilities _xmin _ymin _xmax _ymax _distance _angle _xcoord _ycoord ))

(defmethod object_detection::Prediction
  (:init
   (&key
    ((:classes __classes) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:probabilities __probabilities) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:xmin __xmin) 0)
    ((:ymin __ymin) 0)
    ((:xmax __xmax) 0)
    ((:ymax __ymax) 0)
    ((:distance __distance) 0.0)
    ((:angle __angle) 0.0)
    ((:xcoord __xcoord) 0.0)
    ((:ycoord __ycoord) 0.0)
    )
   (send-super :init)
   (setq _classes __classes)
   (setq _probabilities __probabilities)
   (setq _xmin (round __xmin))
   (setq _ymin (round __ymin))
   (setq _xmax (round __xmax))
   (setq _ymax (round __ymax))
   (setq _distance (float __distance))
   (setq _angle (float __angle))
   (setq _xcoord (float __xcoord))
   (setq _ycoord (float __ycoord))
   self)
  (:classes
   (&optional __classes)
   (if __classes (setq _classes __classes)) _classes)
  (:probabilities
   (&optional __probabilities)
   (if __probabilities (setq _probabilities __probabilities)) _probabilities)
  (:xmin
   (&optional __xmin)
   (if __xmin (setq _xmin __xmin)) _xmin)
  (:ymin
   (&optional __ymin)
   (if __ymin (setq _ymin __ymin)) _ymin)
  (:xmax
   (&optional __xmax)
   (if __xmax (setq _xmax __xmax)) _xmax)
  (:ymax
   (&optional __ymax)
   (if __ymax (setq _ymax __ymax)) _ymax)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:xcoord
   (&optional __xcoord)
   (if __xcoord (setq _xcoord __xcoord)) _xcoord)
  (:ycoord
   (&optional __ycoord)
   (if __ycoord (setq _ycoord __ycoord)) _ycoord)
  (:serialization-length
   ()
   (+
    ;; string[] _classes
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _classes)) 4
    ;; float64[] _probabilities
    (* 8    (length _probabilities)) 4
    ;; int64 _xmin
    8
    ;; int64 _ymin
    8
    ;; int64 _xmax
    8
    ;; int64 _ymax
    8
    ;; float64 _distance
    8
    ;; float64 _angle
    8
    ;; float64 _xcoord
    8
    ;; float64 _ycoord
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _classes
     (write-long (length _classes) s)
     (dolist (elem _classes)
       (write-long (length elem) s) (princ elem s)
       )
     ;; float64[] _probabilities
     (write-long (length _probabilities) s)
     (dotimes (i (length _probabilities))
       (sys::poke (elt _probabilities i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; int64 _xmin
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _xmin (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _xmin) (= (length (_xmin . bv)) 2)) ;; bignum
              (write-long (ash (elt (_xmin . bv) 0) 0) s)
              (write-long (ash (elt (_xmin . bv) 1) -1) s))
             ((and (class _xmin) (= (length (_xmin . bv)) 1)) ;; big1
              (write-long (elt (_xmin . bv) 0) s)
              (write-long (if (>= _xmin 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _xmin s)(write-long (if (>= _xmin 0) 0 #xffffffff) s)))
     ;; int64 _ymin
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _ymin (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _ymin) (= (length (_ymin . bv)) 2)) ;; bignum
              (write-long (ash (elt (_ymin . bv) 0) 0) s)
              (write-long (ash (elt (_ymin . bv) 1) -1) s))
             ((and (class _ymin) (= (length (_ymin . bv)) 1)) ;; big1
              (write-long (elt (_ymin . bv) 0) s)
              (write-long (if (>= _ymin 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _ymin s)(write-long (if (>= _ymin 0) 0 #xffffffff) s)))
     ;; int64 _xmax
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _xmax (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _xmax) (= (length (_xmax . bv)) 2)) ;; bignum
              (write-long (ash (elt (_xmax . bv) 0) 0) s)
              (write-long (ash (elt (_xmax . bv) 1) -1) s))
             ((and (class _xmax) (= (length (_xmax . bv)) 1)) ;; big1
              (write-long (elt (_xmax . bv) 0) s)
              (write-long (if (>= _xmax 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _xmax s)(write-long (if (>= _xmax 0) 0 #xffffffff) s)))
     ;; int64 _ymax
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _ymax (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _ymax) (= (length (_ymax . bv)) 2)) ;; bignum
              (write-long (ash (elt (_ymax . bv) 0) 0) s)
              (write-long (ash (elt (_ymax . bv) 1) -1) s))
             ((and (class _ymax) (= (length (_ymax . bv)) 1)) ;; big1
              (write-long (elt (_ymax . bv) 0) s)
              (write-long (if (>= _ymax 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _ymax s)(write-long (if (>= _ymax 0) 0 #xffffffff) s)))
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _xcoord
       (sys::poke _xcoord (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ycoord
       (sys::poke _ycoord (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _classes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _classes (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _classes i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; float64[] _probabilities
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _probabilities (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _probabilities i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; int64 _xmin
#+(or :alpha :irix6 :x86_64)
      (setf _xmin (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _xmin (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _ymin
#+(or :alpha :irix6 :x86_64)
      (setf _ymin (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _ymin (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _xmax
#+(or :alpha :irix6 :x86_64)
      (setf _xmax (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _xmax (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _ymax
#+(or :alpha :irix6 :x86_64)
      (setf _ymax (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _ymax (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _xcoord
     (setq _xcoord (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ycoord
     (setq _ycoord (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get object_detection::Prediction :md5sum-) "d88eff2e3e2eac200735b76da90deaa4")
(setf (get object_detection::Prediction :datatype-) "object_detection/Prediction")
(setf (get object_detection::Prediction :definition-)
      "string[] classes
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



(provide :object_detection/Prediction "d88eff2e3e2eac200735b76da90deaa4")


