#!/bin/bash

export USER=dev
export DISPLAY=:1

# Start VNC server
vncserver $DISPLAY -geometry 1280x800 -depth 24

# Keep container running
tail -f /dev/null
