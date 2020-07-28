#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/global.sh

info "Checking for Failed systemd Services"
sudo systemctl --failed
