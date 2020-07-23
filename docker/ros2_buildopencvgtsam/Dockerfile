# base on build of ROS
FROM ros2_builddashing
ENV DEBIAN_FRONTEND=noninteractive
#
# Get opencv source
RUN mkdir -p /root/lib/opencv/build && \
  mkdir -p /root/lib/opencv/install && \
  cd /root/lib/opencv &&\
  git clone https://github.com/opencv/opencv.git && \
  git clone https://github.com/opencv/opencv_contrib.git && \
  cd opencv && \
  git checkout 4.4.0 && \
  cd ../opencv_contrib && \
  git checkout 4.4.0
#
# Build opencv
RUN cd /root/lib/opencv/build && \
  cmake ../opencv -DCMAKE_INSTALL_PREFIX=/root/lib/opencv/install -DOPENCV_EXTRA_MODULES_PATH=/root/lib/opencv/opencv_contrib/modules -DCMAKE_BUILD_TYPE=RELEASE \
    -DBUILD_JAVA=0 -DBUILD_PERF_TESTS=0 -DBUILD_TESTS=0 -DBUILD_DOCS=OFF \
    -DINSTALL_C_EXAMPLES=ON  -DINSTALL_PYTHON_EXAMPLES=ON -DBUILD_EXAMPLES=ON \
    -DOPENCV_GENERATE_PKGCONFIG=ON -DWITH_GTK_2_X=ON && \
  make -j 12 && \
  make install
#
# Get GTSAM prerequisits
RUN apt-get install -y libboost-all-dev libtbb-dev
#
# Get GTSAM source
RUN mkdir -p /root/lib/gtsam/build && \
  mkdir -p /root/lib/gtsam/install && \
  cd /root/lib/gtsam &&\
  git clone https://github.com/borglab/gtsam.git && \
  cd gtsam && \
  git checkout 4.0.3
#
# Build GTSAM
RUN cd /root/lib/gtsam/build && \
  cmake ../gtsam -DCMAKE_INSTALL_PREFIX=~/lib/gtsam/install \
    -DGTSAM_BUILD_TESTS=0 -DGTSAM_BUILD_EXAMPLES_ALWAYS=0 -DGTSAM_ALLOW_DEPRICATED_SINCE_V4=0 -DGTSAM_BUILD_WRAP=0 \
    -DGTSAM_INSTALL_CPPUNITLITE=0 -DTSAM_WRAP_SERIALIZATION=0 && \
  make -j 12 && \
  make install
#





