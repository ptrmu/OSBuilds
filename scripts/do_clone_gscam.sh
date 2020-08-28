#!/bin/bash -x
# 
# Get gscam source
mkdir -p ./gscam_ws/src \
  && cd ./gscam_ws/src \
  && git clone https://github.com/clydemcqueen/gscam.git \
  && cd gscam \
  && git checkout ros2