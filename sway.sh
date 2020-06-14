#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/scripts/global.sh


info "Installing Packages for Sway"
sudo pacman --noconfirm -Syu sway waybar	# Sway with top bar 
sudo pacman --noconfirm -Syu xorg-server-xwayland   #Backward Compatibility with X11
sudo pacman --noconfirm -Syu lxapperance  	# Customization of GTK+
info "Utilities"
sudo pacman --noconfirm -Syu awesome-terminal-fonts ttf-liberation  
sudo pacman --noconfirm -Syu firefox 		# Web Browser

sudo pacman --noconfirm -Syu neovim-qt		# GUI Text Editor 
sudo pacman --noconfirm -Syu mako			# Notification
sudo pacman --noconfirm -Syu alacritty		# Terminal 
sudo pacman --noconfirm -Syu wf-recorder	# Screen Recorder 
sudo pacman --noconfirm -Syu grim			# Screen shot
sudo pacman --noconfirm -Syu swaylock 		# Screen Locking
sudo pacman --noconfirm -Syu brightnessctl	# Screen brightness control TODO  
sudo pacman --noconfirm -Syu wofi			# Launcher 
sudo pacman --noconfirm -Syu wl-clipboard	# Clipboard Manager
sudo pacman --noconfirm -Syu ghostscript	# Postscript language support
sudo pacman --noconfirm -Syu pdftricks		# PDF Manipulations
sudo pacman --noconfirm -Syu evolution gnome-keyring # Email Client

info "Zathura PDF and Plug-ins"
sudo pacman --noconfirm -Syu zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps

info "Multimedia frameworks"
sudo pacman --noconfirm -Syu gst-libav gst-plugins-base gst-plugins-good libde265 gstreamer-vaapi

info "Setting packages that enable Wayland GUI and Video Acceleration"
sudo pacman --noconfirm -S qt5-wayland glfw-wayland glew-wayland clutter
sudo pacman --noconfirm -S intel-media-driver libva-intel-driver libvdpau-va-gl libva-utils

info "Installing Wayland compatible launcher and clipboard manager"
sudo pikaur --noconfirm -S kbdlight	# Keyboard Lights TODO

info "Moving Configurations"
# Sway
ln -s ${SHELL_PATH}/config/sway	${HOME}/.config
# Waybar
ln -s ${SHELL_PATH}/config/waybar ${HOME}/.config
# Alacritty
ln -s ${SHELL_PATH}/config/alacritty ${HOME}/.config


