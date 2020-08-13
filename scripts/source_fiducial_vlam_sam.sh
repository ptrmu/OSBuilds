#!/bin/bash
# Configure Environment 
cd ~/flock2_ws && \
  source ~/ros2_dashing/install/local_setup.bash && \
  source install/local_setup.bash && \
  export CMAKE_PREFIX_PATH=~/lib/gtsam/install/lib/cmake/GTSAM:~/lib/opencv/install/lib/cmake/opencv4:$CMAKE_PREFIX_PATH && \
  export LD_LIBRARY_PATH=~/lib/gtsam/install/lib/:~/lib/opencv/install/lib/:$LD_LIBRARY_PATH 


