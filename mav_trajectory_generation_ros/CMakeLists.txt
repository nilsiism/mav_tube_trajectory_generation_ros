cmake_minimum_required(VERSION 2.8.3)
project(mav_trajectory_generation_ros)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)
find_package(catkin_simple REQUIRED)
catkin_simple(ALL_DEPS_REQUIRED)

find_package(MAV REQUIRED)
find_package(SE REQUIRED)
find_package(Eigen3 REQUIRED)
find_package(Glog REQUIRED QUIET)
find_package(NLOPT REQUIRED)
find_package(Sophus REQUIRED)

set(CMAKE_MACOSX_RPATH 0)
add_definitions(-std=c++11)

#############
# LIBRARIES #
#############
cs_add_library(${PROJECT_NAME}
  src/feasibility_analytic.cpp
  src/feasibility_base.cpp
  src/feasibility_recursive.cpp
  src/feasibility_sampling.cpp
  src/input_constraints.cpp
  src/ros_conversions.cpp
  src/ros_visualization.cpp
)

############
# BINARIES #
############
cs_add_executable(trajectory_sampler_node
  src/trajectory_sampler_node.cpp
)

target_link_libraries(trajectory_sampler_node ${PROJECT_NAME}) 
target_include_directories(trajectory_sampler_node PRIVATE ${EIGEN3_INCLUDE_DIR} ${NLOPT_INCLUDE_DIRS} ${SE_INCLUDE_PATH} ${SOPHUS_INCLUDE_DIR} ${GLOG_INCLUDE_DIRS}) # 
target_include_directories(trajectory_sampler_node PUBLIC ${MAV_INCLUDE_PATH} ${MOSEK_INCLUDE_DIR})  
target_link_libraries(trajectory_sampler_node ${MAV_LIBRARY} ${MOSEK_LIBRARY} ${NLOPT_LIBRARIES} glog)

#cs_add_executable(time_evaluation_node
#  src/time_evaluation_node.cpp
#)
#target_link_libraries(time_evaluation_node ${PROJECT_NAME})

#########
# TESTS #
#########
#catkin_add_gtest(test_feasibility
#  test/test_feasibility.cpp
#)
#target_link_libraries(test_feasibility ${PROJECT_NAME} ${catkin_LIBRARIES})

##########
# EXPORT #
##########
cs_install()
cs_export()
