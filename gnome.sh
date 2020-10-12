#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/bin/global.sh


sudo pacman --noconfirm -Syu gnome gnome-extra gnome-tweaks gdm

sudo pacman --noconfirm -Syu awesome-terminal-fonts ttf-liberation  
sudo pacman --noconfirm -Syu firefox 		# Web Browser
sudo pacman --noconfirm -Syu alacritty		# Terminal 

info "Zathura PDF and Plug-ins"
sudo pacman --noconfirm -Syu zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps

info "Multimedia frameworks"
sudo pacman --noconfirm -Syu gst-libav gst-plugins-base gst-plugins-good libde265 gstreamer-vaapi

info "Setting packages that enable Wayland GUI and Video Acceleration"
sudo pacman --noconfirm -S qt5-wayland glfw-wayland glew-wayland clutter
sudo pacman --noconfirm -S intel-media-driver libva-intel-driver libvdpau-va-gl libva-utils

gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

#sudo systemctl enable gdm
#sudo systemctl start gdm

