; Auto-generated. Do not edit!


(cl:in-package point_navigation-srv)


;//! \htmlinclude goToPoint-request.msg.html

(cl:defclass <goToPoint-request> (roslisp-msg-protocol:ros-message)
  ((tf_prefix
    :reader tf_prefix
    :initarg :tf_prefix
    :type cl:string
    :initform "")
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass goToPoint-request (<goToPoint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <goToPoint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'goToPoint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name point_navigation-srv:<goToPoint-request> is deprecated: use point_navigation-srv:goToPoint-request instead.")))

(cl:ensure-generic-function 'tf_prefix-val :lambda-list '(m))
(cl:defmethod tf_prefix-val ((m <goToPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader point_navigation-srv:tf_prefix-val is deprecated.  Use point_navigation-srv:tf_prefix instead.")
  (tf_prefix m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <goToPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader point_navigation-srv:pose-val is deprecated.  Use point_navigation-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <goToPoint-request>) ostream)
  "Serializes a message object of type '<goToPoint-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'tf_prefix))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'tf_prefix))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <goToPoint-request>) istream)
  "Deserializes a message object of type '<goToPoint-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tf_prefix) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'tf_prefix) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<goToPoint-request>)))
  "Returns string type for a service object of type '<goToPoint-request>"
  "point_navigation/goToPointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'goToPoint-request)))
  "Returns string type for a service object of type 'goToPoint-request"
  "point_navigation/goToPointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<goToPoint-request>)))
  "Returns md5sum for a message object of type '<goToPoint-request>"
  "600260651fd011534c1d100c4ede3201")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'goToPoint-request)))
  "Returns md5sum for a message object of type 'goToPoint-request"
  "600260651fd011534c1d100c4ede3201")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<goToPoint-request>)))
  "Returns full string definition for message of type '<goToPoint-request>"
  (cl:format cl:nil "string tf_prefix~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'goToPoint-request)))
  "Returns full string definition for message of type 'goToPoint-request"
  (cl:format cl:nil "string tf_prefix~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <goToPoint-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'tf_prefix))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <goToPoint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'goToPoint-request
    (cl:cons ':tf_prefix (tf_prefix msg))
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude goToPoint-response.msg.html

(cl:defclass <goToPoint-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass goToPoint-response (<goToPoint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <goToPoint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'goToPoint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name point_navigation-srv:<goToPoint-response> is deprecated: use point_navigation-srv:goToPoint-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <goToPoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader point_navigation-srv:success-val is deprecated.  Use point_navigation-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <goToPoint-response>) ostream)
  "Serializes a message object of type '<goToPoint-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <goToPoint-response>) istream)
  "Deserializes a message object of type '<goToPoint-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<goToPoint-response>)))
  "Returns string type for a service object of type '<goToPoint-response>"
  "point_navigation/goToPointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'goToPoint-response)))
  "Returns string type for a service object of type 'goToPoint-response"
  "point_navigation/goToPointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<goToPoint-response>)))
  "Returns md5sum for a message object of type '<goToPoint-response>"
  "600260651fd011534c1d100c4ede3201")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'goToPoint-response)))
  "Returns md5sum for a message object of type 'goToPoint-response"
  "600260651fd011534c1d100c4ede3201")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<goToPoint-response>)))
  "Returns full string definition for message of type '<goToPoint-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'goToPoint-response)))
  "Returns full string definition for message of type 'goToPoint-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <goToPoint-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <goToPoint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'goToPoint-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'goToPoint)))
  'goToPoint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'goToPoint)))
  'goToPoint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'goToPoint)))
  "Returns string type for a service object of type '<goToPoint>"
  "point_navigation/goToPoint")