# Base on build with opencv and GTSAM
FROM dashing_opencvgtsam
ENV DEBIAN_FRONTEND=noninteractive
#
# Get flock2 source
RUN mkdir   -p /root/flock2_ws/src && \
  cd /root/flock2_ws/src && \
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
#
# Configure Environment and build
WORKDIR /root/flock2_ws
SHELL ["/bin/bash", "-c"]
#RUN source /root/ros2_dashing/install/local_setup.bash
#RUN printenv | grep CMAKE_PREFIX
#RUN echo "done"
RUN source /root/ros2_dashing/install/local_setup.bash && \
      find ~/ros2_dashing/install -name '*tiny*' && \
      printenv | grep tiny && \
      export CMAKE_PREFIX_PATH=~/lib/gtsam/install/lib/cmake/GTSAM:~/lib/opencv/install/lib/cmake/opencv4:$CMAKE_PREFIX_PATH && \
      export LD_LIBRARY_PATH=~/lib/gtsam/install/lib/:~/lib/opencv/install/lib/:$LD_LIBRARY_PATH && \
      find ~/ros2_dashing/install -name '*tiny*' && \
      printenv | grep tiny && \
      colcon build





