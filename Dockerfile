# Use a base image with a recent Ubuntu version
FROM ubuntu:22.04

# Set environment variables for non-interactive apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Update apt and install essential build tools and Qt dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libgl-dev \
    libxkbcommon-x11-dev \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-render-util0 \
    libxcb-xfixes0 \
    libxcb-xinerama0 \
    libxcb-randr0 \
    libxcb-shape0 \
    libxcb-sync1 \
    libxcb-util1 \
    libxcb-xkb1 \
    libxkbcommon-dev \
    qt6-base-dev \
    qt6-base-dev-tools \
    qt6-tools-dev \
    qt6-tools-dev-tools \
    gdb \
    clang \
    lldb \
    # Add any other Qt modules you need, e.g.:
    # qt6-charts-dev \
    # qt6-declarative-dev \
    # qt6-quickcontrols2-dev \
    # qt6-svg-dev \
    # Add any other libraries specific to your application
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user for development (recommended for security)
ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(ALL\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && rm -rf /var/lib/apt/lists/*

USER $USERNAME
WORKDIR /home/$USERNAME/app

# Set DISPLAY environment variable for GUI applications
# This assumes you will expose your X server from the host
ENV DISPLAY=:0