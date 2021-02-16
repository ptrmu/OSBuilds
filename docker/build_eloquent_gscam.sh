#!/bin/bash -x
#
docker build --tag ros2_prep_eloquent -f- ../scripts <<EOF
FROM ros2_eloquent_base
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_prep_eloquent.sh scripts/do_prep_eloquent.sh
RUN ./scripts/do_prep_eloquent.sh
EOF
#
docker build --tag ros2_get_eloquent -f- ../scripts <<EOF
FROM ros2_prep_eloquent
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_get_eloquent.sh ./scripts/do_get_eloquent.sh
RUN ./scripts/do_get_eloquent.sh
EOF
#
docker build --tag eloquent_get_gstreamer -f- ../scripts <<EOF
FROM ros2_get_eloquent
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_get_gstreamer.sh ./scripts/do_get_gstreamer.sh
RUN ./scripts/do_get_gstreamer.sh
EOF
#
docker build --tag eloquent_clone_gscam -f- ../scripts <<EOF
FROM eloquent_get_gstreamer
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_clone_gscam.sh ./scripts/do_clone_gscam.sh
RUN ./scripts/do_clone_gscam.sh
EOF
#
docker build --tag eloquent_build_gscam -f- ../scripts <<EOF
FROM eloquent_clone_gscam
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root/Work
COPY do_build_gscam_eloquent.sh ./scripts/do_build_gscam_eloquent.sh
RUN ./scripts/do_build_gscam_eloquent.sh
EOF
