# Use ubuntu 18.04
FROM ros2_dashing_base
ENV DEBIAN_FRONTEND=noninteractive
#
# Set up the Locale
RUN apt-get install -y locales && \
    locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    export LANG=en_US.UTF-8
#
# Add the ROS2 apt repository
RUN apt-get install -y curl gnupg2 lsb-release && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && \
    sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'
#
# Install dev tools and ROS tools
RUN apt update && apt install -y \
    build-essential \
    cmake \
    git \
    python3-colcon-common-extensions \
    python3-pip \
    python-rosdep \
    python3-vcstool \
    wget && \
  python3 -m pip install -U \
    argcomplete \
    flake8 \
    flake8-blind-except \
    flake8-builtins \
    flake8-class-newline \
    flake8-comprehensions \
    flake8-deprecated \
    flake8-docstrings \
    flake8-import-order \
    flake8-quotes \
    pytest-repeat \
    pytest-rerunfailures \
    pytest \
    pytest-cov \
    pytest-runner \
    setuptools && \
  apt install --no-install-recommends -y \
    libasio-dev \
    libtinyxml2-dev && \
  apt install --no-install-recommends -y \
    libcunit1-dev
#
# Get ROS2 Code
RUN mkdir -p ~/ros2_dashing/src && \
    cd ~/ros2_dashing/ && \
    wget https://raw.githubusercontent.com/ros2/ros2/dashing/ros2.repos && \
    vcs import src < ros2.repos
#
# Install dependencies using rosdep
RUN cd ~/ros2_dashing/ && \
    rosdep init && \
    rosdep update && \
    rosdep install --from-paths src --ignore-src --rosdistro dashing -y --skip-keys "console_bridge fastcdr fastrtps libopensplice67 libopensplice69 rti-connext-dds-5.3.1 urdf"
#
# Build the code in the workspace
RUN cd ~/ros2_dashing/ && \
    colcon build
 

