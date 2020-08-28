#!/bin/bash -x
# 
# Get gstreamer
apt update \
    && apt install -y gstreamer1.0-tools libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev
