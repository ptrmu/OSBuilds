#!/bin/bash -x
# 
# Get ROS2 Code
mkdir -p ./ros2_dashing/src \
    && cd ./ros2_dashing/ \
    && wget https://raw.githubusercontent.com/ros2/ros2/dashing/ros2.repos \
    && vcs import src < ros2.repos
#
# Install dependencies using rosdep
# Note still in ros_dashing directory
rosdep init \
    && rosdep update \
    && rosdep install --from-paths src --ignore-src --rosdistro dashing -y --skip-keys "console_bridge fastcdr fastrtps libopensplice67 libopensplice69 rti-connext-dds-5.3.1 urdf"
