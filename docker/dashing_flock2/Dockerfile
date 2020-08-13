# Base on build with opencv and GTSAM
FROM dashing_opencvgtsam
ENV DEBIAN_FRONTEND=noninteractive
#
# Get flock2 source
RUN mkdir -p /root/flock2_ws/src && \
  cd /root/flock2_ws/src && \
  git clone https://github.com/ptrmu/fiducial_vlam_sam.git && \
  git clone https://github.com/ptrmu/ros2_shared.git && \
  git clone https://github.com/clydemcqueen/opencv_cam.git && \
  cd opencv_cam && \
  git checkout ptrmu_work_with_zed_camera
#
# Configure Environment and build
WORKDIR /root/flock2_ws
RUN /bin/bash -c "source /root/ros2_dashing/install/setup.bash && \
      export CMAKE_PREFIX_PATH=~/lib/gtsam/install/lib/cmake/GTSAM:~/lib/opencv/install/lib/cmake/opencv4:$CMAKE_PREFIX_PATH && \
      export LD_LIBRARY_PATH=~/lib/gtsam/install/lib/:~/lib/opencv/install/lib/:$LD_LIBRARY_PATH && \
      colcon build "

RUN printenv




