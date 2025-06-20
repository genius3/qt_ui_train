FROM ubuntu:22.04

# Install Qt6 and build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    qt6-base-dev \
    qt6-base-dev-tools \
    qt6-tools-dev \
    qt6-tools-dev-tools \
    libgl1-mesa-dev \
    libxkbcommon-x11-0 \
    libxcb1 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-shape0 \
    libxcb-shm0 \
    libxcb-sync1 \
    libxcb-util1 \
    libxcb-xfixes0 \
    libxcb-xinerama0 \
    libxcb-xkb1 \
    libx11-xcb1 \
    libxrender1 \
    libxi6 \
    vim cmake gdb git tmux wget gdb clang lldb \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add non-root user
RUN useradd -ms /bin/bash dev
USER dev
WORKDIR /home/dev

# ENV DISPLAY=host.docker.internal:0
ENV DISPLAY=:0
