# requires sudo privileges
docker build --tag ros2_dashing_base - <<EOF
# Use UBUNTU 18.04 for OS  
FROM ubuntu:18.04
#
# Upgrade the OS
RUN apt-get update && \
    apt-get upgrade -y
EOF


