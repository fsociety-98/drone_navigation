;; Auto-generated. Do not edit!


(when (boundp 'point_navigation::goToPoint)
  (if (not (find-package "POINT_NAVIGATION"))
    (make-package "POINT_NAVIGATION"))
  (shadow 'goToPoint (find-package "POINT_NAVIGATION")))
(unless (find-package "POINT_NAVIGATION::GOTOPOINT")
  (make-package "POINT_NAVIGATION::GOTOPOINT"))
(unless (find-package "POINT_NAVIGATION::GOTOPOINTREQUEST")
  (make-package "POINT_NAVIGATION::GOTOPOINTREQUEST"))
(unless (find-package "POINT_NAVIGATION::GOTOPOINTRESPONSE")
  (make-package "POINT_NAVIGATION::GOTOPOINTRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass point_navigation::goToPointRequest
  :super ros::object
  :slots (_tf_prefix _pose ))

(defmethod point_navigation::goToPointRequest
  (:init
   (&key
    ((:tf_prefix __tf_prefix) "")
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _tf_prefix (string __tf_prefix))
   (setq _pose __pose)
   self)
  (:tf_prefix
   (&optional __tf_prefix)
   (if __tf_prefix (setq _tf_prefix __tf_prefix)) _tf_prefix)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; string _tf_prefix
    4 (length _tf_prefix)
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _tf_prefix
       (write-long (length _tf_prefix) s) (princ _tf_prefix s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _tf_prefix
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _tf_prefix (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(defclass point_navigation::goToPointResponse
  :super ros::object
  :slots (_success ))

(defmethod point_navigation::goToPointResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass point_navigation::goToPoint
  :super ros::object
  :slots ())

(setf (get point_navigation::goToPoint :md5sum-) "600260651fd011534c1d100c4ede3201")
(setf (get point_navigation::goToPoint :datatype-) "point_navigation/goToPoint")
(setf (get point_navigation::goToPoint :request) point_navigation::goToPointRequest)
(setf (get point_navigation::goToPoint :response) point_navigation::goToPointResponse)

(defmethod point_navigation::goToPointRequest
  (:response () (instance point_navigation::goToPointResponse :init)))

(setf (get point_navigation::goToPointRequest :md5sum-) "600260651fd011534c1d100c4ede3201")
(setf (get point_navigation::goToPointRequest :datatype-) "point_navigation/goToPointRequest")
(setf (get point_navigation::goToPointRequest :definition-)
      "string tf_prefix
geometry_msgs/Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success

")

(setf (get point_navigation::goToPointResponse :md5sum-) "600260651fd011534c1d100c4ede3201")
(setf (get point_navigation::goToPointResponse :datatype-) "point_navigation/goToPointResponse")
(setf (get point_navigation::goToPointResponse :definition-)
      "string tf_prefix
geometry_msgs/Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success

")



(provide :point_navigation/goToPoint "600260651fd011534c1d100c4ede3201")


