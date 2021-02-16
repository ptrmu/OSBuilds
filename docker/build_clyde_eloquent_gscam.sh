#!/bin/bash -x

# Run with rocker:
# rocker --x11 --nvidia --user clyde_eloquent_desktop_gscam
docker build --tag clyde_eloquent_desktop_gscam -f- ../scripts <<EOF

# Start with osrf desktop image
FROM osrf/ros:eloquent-desktop

# Upgrade the OS
RUN apt-get update && apt-get upgrade -y

# Install locate and run updatedb, handy for development
RUN apt-get install locate
RUN updatedb

# Add gstreamer
COPY do_get_gstreamer.sh ./scripts/do_get_gstreamer.sh
RUN ./scripts/do_get_gstreamer.sh

# Deps for gscam:ros2
RUN apt-get install -y ros-eloquent-camera-calibration-parsers
RUN apt-get install -y ros-eloquent-camera-info-manager

# Get gscam
RUN mkdir /workspace/gscam/src -p
WORKDIR /workspace/gscam/src
RUN git clone https://github.com/clydemcqueen/gscam.git -b ros2

# Build workspace
WORKDIR /workspace/gscam
RUN . /opt/ros/eloquent/setup.sh && colcon build

# Set up entrypoint
# TODO doesn't work??? Get permission denied when I run with rocker, with --user or without
# COPY gscam_entrypoint.sh /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]

# Command
# CMD ros2 run gscam gscam
EOF
