
(cl:in-package :asdf)

(defsystem "jetsontx1_cvmodule-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Peoplecount" :depends-on ("_package_Peoplecount"))
    (:file "_package_Peoplecount" :depends-on ("_package"))
    (:file "Prediction" :depends-on ("_package_Prediction"))
    (:file "_package_Prediction" :depends-on ("_package"))
    (:file "Predictions" :depends-on ("_package_Predictions"))
    (:file "_package_Predictions" :depends-on ("_package"))
  ))