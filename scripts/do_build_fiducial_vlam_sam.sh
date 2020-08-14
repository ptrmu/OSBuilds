#!/bin/bash
# 
# Configure Environment and build
source ./ros2_dashing/install/local_setup.bash \
    && export CMAKE_PREFIX_PATH=$PWD/lib/gtsam/install/lib/cmake/GTSAM:$PWD/lib/opencv/install/lib/cmake/opencv4:$CMAKE_PREFIX_PATH \
    && export LD_LIBRARY_PATH=$PWD/lib/gtsam/install/lib/:$PWD/lib/opencv/install/lib/:$LD_LIBRARY_PATH \
    && cd ./flock2_ws/ \
    && colcon build

