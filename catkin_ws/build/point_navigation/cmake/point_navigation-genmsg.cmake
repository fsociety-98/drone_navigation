# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "point_navigation: 0 messages, 1 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Inav_msgs:/opt/ros/kinetic/share/nav_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(point_navigation_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/sumanth/PROJECT/drone_navigation/catkin_ws/src/point_navigation/srv/goToPoint.srv" NAME_WE)
add_custom_target(_point_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "point_navigation" "/home/sumanth/PROJECT/drone_navigation/catkin_ws/src/point_navigation/srv/goToPoint.srv" "geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(point_navigation
  "/home/sumanth/PROJECT/drone_navigation/catkin_ws/src/point_navigation/srv/goToPoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/point_navigation
)

### Generating Module File
_generate_module_cpp(point_navigation
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/point_navigation
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(point_navigation_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(point_navigation_generate_messages point_navigation_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sumanth/PROJECT/drone_navigation/catkin_ws/src/point_navigation/srv/goToPoint.srv" NAME_WE)
add_dependencies(point_navigation_generate_messages_cpp _point_navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(point_navigation_gencpp)
add_dependencies(point_navigation_gencpp point_navigation_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS point_navigation_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(point_navigation
  "/home/sumanth/PROJECT/drone_navigation/catkin_ws/src/point_navigation/srv/goToPoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/point_navigation
)

### Generating Module File
_generate_module_eus(point_navigation
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/point_navigation
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(point_navigation_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(point_navigation_generate_messages point_navigation_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sumanth/PROJECT/drone_navigation/catkin_ws/src/point_navigation/srv/goToPoint.srv" NAME_WE)
add_dependencies(point_navigation_generate_messages_eus _point_navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(point_navigation_geneus)
add_dependencies(point_navigation_geneus point_navigation_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS point_navigation_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(point_navigation
  "/home/sumanth/PROJECT/drone_navigation/catkin_ws/src/point_navigation/srv/goToPoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/point_navigation
)

### Generating Module File
_generate_module_lisp(point_navigation
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/point_navigation
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(point_navigation_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(point_navigation_generate_messages point_navigation_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sumanth/PROJECT/drone_navigation/catkin_ws/src/point_navigation/srv/goToPoint.srv" NAME_WE)
add_dependencies(point_navigation_generate_messages_lisp _point_navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(point_navigation_genlisp)
add_dependencies(point_navigation_genlisp point_navigation_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS point_navigation_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(point_navigation
  "/home/sumanth/PROJECT/drone_navigation/catkin_ws/src/point_navigation/srv/goToPoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/point_navigation
)

### Generating Module File
_generate_module_nodejs(point_navigation
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/point_navigation
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(point_navigation_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(point_navigation_generate_messages point_navigation_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sumanth/PROJECT/drone_navigation/catkin_ws/src/point_navigation/srv/goToPoint.srv" NAME_WE)
add_dependencies(point_navigation_generate_messages_nodejs _point_navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(point_navigation_gennodejs)
add_dependencies(point_navigation_gennodejs point_navigation_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS point_navigation_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(point_navigation
  "/home/sumanth/PROJECT/drone_navigation/catkin_ws/src/point_navigation/srv/goToPoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/point_navigation
)

### Generating Module File
_generate_module_py(point_navigation
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/point_navigation
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(point_navigation_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(point_navigation_generate_messages point_navigation_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sumanth/PROJECT/drone_navigation/catkin_ws/src/point_navigation/srv/goToPoint.srv" NAME_WE)
add_dependencies(point_navigation_generate_messages_py _point_navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(point_navigation_genpy)
add_dependencies(point_navigation_genpy point_navigation_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS point_navigation_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/point_navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/point_navigation
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(point_navigation_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(point_navigation_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(point_navigation_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/point_navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/point_navigation
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(point_navigation_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(point_navigation_generate_messages_eus nav_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(point_navigation_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/point_navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/point_navigation
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(point_navigation_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(point_navigation_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(point_navigation_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/point_navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/point_navigation
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(point_navigation_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(point_navigation_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(point_navigation_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/point_navigation)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/point_navigation\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/point_navigation
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(point_navigation_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(point_navigation_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(point_navigation_generate_messages_py std_msgs_generate_messages_py)
endif()
