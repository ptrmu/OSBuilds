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
docker build --tag ros2_get_dashing -f- ../scripts <<EOF
FROM ros2_prep_dashing
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_get_dashing.sh ./scripts/do_get_dashing.sh
RUN ./scripts/do_get_dashing.sh
EOF
#
docker build --tag dashing_get_gstreamer -f- ../scripts <<EOF
FROM ros2_get_dashing
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_get_gstreamer.sh ./scripts/do_get_gstreamer.sh
RUN ./scripts/do_get_gstreamer.sh
EOF
#
docker build --tag dashing_clone_gscam -f- ../scripts <<EOF
FROM dashing_get_gstreamer
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_clone_gscam.sh ./scripts/do_clone_gscam.sh
RUN ./scripts/do_clone_gscam.sh
EOF
#
docker build --tag dashing_build_gscam -f- ../scripts <<EOF
FROM dashing_clone_gscam
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_build_gscam_dashing.sh ./scripts/do_build_gscam_dashing.sh
RUN ./scripts/do_build_gscam_dashing.sh
EOF
