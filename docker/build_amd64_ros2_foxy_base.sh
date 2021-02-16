# requires sudo privileges
docker build --tag ros2_foxy_base - <<EOF
# Use UBUNTU 20.04 for OS
FROM ubuntu:20.04
#
# Upgrade the OS
RUN apt-get update && \
    apt-get upgrade -y
EOF
