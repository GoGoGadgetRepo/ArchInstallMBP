#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/scripts/global.sh

info "Installing Xorg"
sudo pacman --noconfirm -Syu xorg-server		# Xorg Server
sudo pacman --noconfirm -Syu xorg-apps			# Xorg Apps 
sudo pacman --noconfirm -Syu xf86-video-intel mesa 	# X Video Drivers
sudo pacman --noconfirm -Syu xf86-video-fbdev		# Fallback Video Driver

info "Wayland Stuff --> Preparing for future switch over"
sudo pacman --noconfirm -Syu plasma-wayland-session


info "KDE"
sudo pacman --noconfirm -Syu plasma-meta
sudo pacman --noconfirm -syu kde-applications-meta 
sudo pacman --noconfirm -syu gdm
