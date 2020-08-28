#!/bin/bash
# 
# Configure environment, run rosdep, and build
cd ./gscam_ws/ \
    && source /opt/ros/dashing/setup.bash \
    && rosdep init \
    && rosdep update \
    && rosdep install -y --from-paths . --ignore-src \
    && colcon build
