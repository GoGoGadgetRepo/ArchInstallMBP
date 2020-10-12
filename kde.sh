#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/bin/global.sh

info "Installing Xorg & Intel Drivers"
install ${SHELL_PATH}/data/xorg.list

info "Installing KDE"
install ${SHELL_PATH}/data/kde.list

info "Installing Preferred Applications"
install ${SHELL_PATH}/data/myapps.list

info "Multimedia frameworks"
sudo pacman --noconfirm -Syu gst-libav gst-plugins-base gst-plugins-good libde265 gstreamer-vaapi

info "Setting packages that enable Wayland GUI and Video Acceleration"
sudo pacman --noconfirm -S qt5-wayland glfw-wayland glew-wayland clutter
sudo pacman --noconfirm -S intel-media-driver libva-intel-driver libvdpau-va-gl libva-utils


#info "Login Manager"
#sudo pacman --noconfirm -Syu gdm

#sudo systemctl enable gdm
#sudo systemctl start gdm
