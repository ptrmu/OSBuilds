#!/bin/bash -x
#
docker build --tag ros2_prep_foxy -f- ../scripts <<EOF
FROM ros2_foxy_base
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_prep_foxy.sh scripts/do_prep_foxy.sh
RUN ./scripts/do_prep_foxy.sh
EOF
#
docker build --tag ros2_get_foxy -f- ../scripts <<EOF
FROM ros2_prep_foxy
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_get_foxy.sh ./scripts/do_get_foxy.sh
RUN ./scripts/do_get_foxy.sh
EOF
#
docker build --tag foxy_get_gstreamer -f- ../scripts <<EOF
FROM ros2_get_foxy
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_get_gstreamer.sh ./scripts/do_get_gstreamer.sh
RUN ./scripts/do_get_gstreamer.sh
EOF
#
docker build --tag foxy_clone_gscam -f- ../scripts <<EOF
FROM foxy_get_gstreamer
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_clone_gscam.sh ./scripts/do_clone_gscam.sh
RUN ./scripts/do_clone_gscam.sh
EOF
#
docker build --tag foxy_build_gscam -f- ../scripts <<EOF
FROM foxy_clone_gscam
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_build_gscam_foxy.sh ./scripts/do_build_gscam_foxy.sh
RUN ./scripts/do_build_gscam_foxy.sh
EOF
