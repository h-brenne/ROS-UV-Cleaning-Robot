;; Auto-generated. Do not edit!


(when (boundp 'grid_map_msgs::ProcessFile)
  (if (not (find-package "GRID_MAP_MSGS"))
    (make-package "GRID_MAP_MSGS"))
  (shadow 'ProcessFile (find-package "GRID_MAP_MSGS")))
(unless (find-package "GRID_MAP_MSGS::PROCESSFILE")
  (make-package "GRID_MAP_MSGS::PROCESSFILE"))
(unless (find-package "GRID_MAP_MSGS::PROCESSFILEREQUEST")
  (make-package "GRID_MAP_MSGS::PROCESSFILEREQUEST"))
(unless (find-package "GRID_MAP_MSGS::PROCESSFILERESPONSE")
  (make-package "GRID_MAP_MSGS::PROCESSFILERESPONSE"))

(in-package "ROS")





(defclass grid_map_msgs::ProcessFileRequest
  :super ros::object
  :slots (_file_path _topic_name ))

(defmethod grid_map_msgs::ProcessFileRequest
  (:init
   (&key
    ((:file_path __file_path) "")
    ((:topic_name __topic_name) "")
    )
   (send-super :init)
   (setq _file_path (string __file_path))
   (setq _topic_name (string __topic_name))
   self)
  (:file_path
   (&optional __file_path)
   (if __file_path (setq _file_path __file_path)) _file_path)
  (:topic_name
   (&optional __topic_name)
   (if __topic_name (setq _topic_name __topic_name)) _topic_name)
  (:serialization-length
   ()
   (+
    ;; string _file_path
    4 (length _file_path)
    ;; string _topic_name
    4 (length _topic_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _file_path
       (write-long (length _file_path) s) (princ _file_path s)
     ;; string _topic_name
       (write-long (length _topic_name) s) (princ _topic_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _file_path
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _file_path (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _topic_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _topic_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass grid_map_msgs::ProcessFileResponse
  :super ros::object
  :slots (_success ))

(defmethod grid_map_msgs::ProcessFileResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
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

(defclass grid_map_msgs::ProcessFile
  :super ros::object
  :slots ())

(setf (get grid_map_msgs::ProcessFile :md5sum-) "03f389710f49a6dd2a8b447bb2850cd6")
(setf (get grid_map_msgs::ProcessFile :datatype-) "grid_map_msgs/ProcessFile")
(setf (get grid_map_msgs::ProcessFile :request) grid_map_msgs::ProcessFileRequest)
(setf (get grid_map_msgs::ProcessFile :response) grid_map_msgs::ProcessFileResponse)

(defmethod grid_map_msgs::ProcessFileRequest
  (:response () (instance grid_map_msgs::ProcessFileResponse :init)))

(setf (get grid_map_msgs::ProcessFileRequest :md5sum-) "03f389710f49a6dd2a8b447bb2850cd6")
(setf (get grid_map_msgs::ProcessFileRequest :datatype-) "grid_map_msgs/ProcessFileRequest")
(setf (get grid_map_msgs::ProcessFileRequest :definition-)
      "# Absolute file path.
string file_path

# For ROS bags: topic name that should be processed (optional).
string topic_name

---

# True if file processing was successful.
bool success

")

(setf (get grid_map_msgs::ProcessFileResponse :md5sum-) "03f389710f49a6dd2a8b447bb2850cd6")
(setf (get grid_map_msgs::ProcessFileResponse :datatype-) "grid_map_msgs/ProcessFileResponse")
(setf (get grid_map_msgs::ProcessFileResponse :definition-)
      "# Absolute file path.
string file_path

# For ROS bags: topic name that should be processed (optional).
string topic_name

---

# True if file processing was successful.
bool success

")



(provide :grid_map_msgs/ProcessFile "03f389710f49a6dd2a8b447bb2850cd6")


