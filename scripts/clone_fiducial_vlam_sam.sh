#!/bin/bash
# Get source
mkdir -p ~/flock2_ws/src && \
  cd ~/flock2_ws/src && \
  rm -rf fiducial_vlam_sam ros2_shared opencv_cam image_common vision_opencv
  git clone https://github.com/ptrmu/fiducial_vlam_sam.git && \
  git clone https://github.com/ptrmu/ros2_shared.git && \
  git clone https://github.com/clydemcqueen/opencv_cam.git && \
  cd opencv_cam && \
  git checkout ptrmu_work_with_zed_camera && \
  cd .. && \
  git clone https://github.com/ros-perception/image_common.git && \
  cd image_common && \
  git checkout dashing && \
  cd .. && \
  git clone https://github.com/ros-perception/vision_opencv.git && \
  cd vision_opencv && \
  git checkout dashing && \
  cd ..



