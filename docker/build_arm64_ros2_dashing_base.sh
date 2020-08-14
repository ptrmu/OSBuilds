# requires sudo privileges
docker build --tag ros2_dashing_base - <<EOF
# Use UBUNTU 18.04 for OS  
FROM nvcr.io/nvidia/l4t-base:r32.4.3
#
# Upgrade the OS
RUN apt-get update && \
    apt-get upgrade -y
EOF


