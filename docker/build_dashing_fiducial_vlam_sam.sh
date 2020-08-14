#!/bin/bash -x
# 
docker build --tag ros2_prep_dashing -f- ../scripts <<EOF
FROM ros2_dashing_base
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_prep_dashing.sh scripts/do_prep_dashing.sh
RUN ./scripts/do_prep_dashing.sh
EOF
#
docker build --tag ros2_clone_dashing -f- ../scripts <<EOF
FROM ros2_prep_dashing
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_clone_dashing.sh ./scripts/do_clone_dashing.sh
RUN ./scripts/do_clone_dashing.sh
EOF
#
docker build --tag ros2_build_dashing -f- ../scripts <<EOF
FROM ros2_clone_dashing
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_build_dashing.sh ./scripts/do_build_dashing.sh
RUN ./scripts/do_build_dashing.sh
EOF
#
docker build --tag ros2_build_opencv_gtsam -f- ../scripts <<EOF
FROM ros2_build_dashing
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_build_opencv_gtsam.sh ./scripts/do_build_opencv_gtsam.sh
RUN ./scripts/do_build_opencv_gtsam.sh
EOF
#
docker build --tag ros2_clone_fiducial_vlam_sam -f- ../scripts <<EOF
FROM ros2_build_opencv_gtsam
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_clone_fiducial_vlam_sam.sh ./scripts/do_clone_fiducial_vlam_sam.sh
RUN ./scripts/do_clone_fiducial_vlam_sam.sh
EOF
#
docker build --tag ros2_build_fiducial_vlam_sam -f- ../scripts <<EOF
FROM ros2_clone_fiducial_vlam_sam
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_build_fiducial_vlam_sam.sh ./scripts/do_build_fiducial_vlam_sam.sh
RUN ./scripts/do_build_fiducial_vlam_sam.sh
EOF
