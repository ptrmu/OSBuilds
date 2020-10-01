#!/bin/bash
# 
# Configure environment, run rosdep, and build
# TODO I think we can use $ROS_DISTRO instead of dashing, thereby avoiding creating multiple do_build_foo.sh files
cd ./gscam_ws/ \
    && source /opt/ros/dashing/setup.bash \
    && rosdep init \
    && rosdep update \
    && rosdep install -y --from-paths . --ignore-src \
    && colcon build
