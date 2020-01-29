
(cl:in-package :asdf)

(defsystem "point_navigation-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "goToPoint" :depends-on ("_package_goToPoint"))
    (:file "_package_goToPoint" :depends-on ("_package"))
  ))