#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/scripts/global.sh


info "Installing Packages for Sway"
sudo pacman --noconfirm -Syu sway waybar	# Sway with top bar 
sudo pacman --noconfirm -Syu xorg-server-xwayland   #Backward Compatibility with X11
sudo pacman --noconfirm -Syu lxapperance  	# Customization of GTK+
info "Utilities"
sudo pacman --noconfirm -Syu awesome awesome-terminal-fonts ttf-liberation  
sudo pacman --noconfirm -Syu epiphany 		# Web Browser
gsettings set org.gnome.Epiphany.web:/ hardware-acceleration-policy 'always'

sudo pacman --noconfirm -Syu neovim-qt		# GUI Text Editor 
sudo pacman --noconfirm -Syu mako		# Notification
sudo pacman --noconfirm -Syu alacritty		# Terminal 
sudo pacman --noconfirm -Syu wf-recorder	# Screen Recorder 
sudo pacman --noconfirm -Syu grim		# Screen shot
sudo pacman --noconfirm -Syu swaylock 		# Screen Locking
sudo pacman --noconfirm -Syu brightnessctl	# Screen brightness control TODO  
sudo pacman --noconfirm -Syu wofi		# Launcher 
sudo pacman --noconfirm -Syu wl-clipboard	# Clipboard Manager
sudo pacman --noconfirm -Syu ghostscript	# Postscript language support
sudo pacman --noconfirm -Syu pdftricks		# PDF Manipulations

info "Zathura PDF and Plug-ins"
sudo pacman --noconfirm -Syu zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-pdf-poppler zathura-ps

info "Multimedia frameworks"
sudo pacman --noconfirm -Syu gst-libav gst-plugins-base gst-plugins-good libde265 gstreamer-vaapi

info "Setting packages that enable Wayland GUI"
sudo pacman --noconfirm -S qt5-wayland glfw-wayland glew-wayland clutter

info "Installing Wayland compatible launcher and clipboard manager"
sudo pikaur --noconfirm -S kbdlight	# Keyboard Lights TODO

info "Moving Configurations"
# Sway
mkdir -p ${HOME}/.config/sway
ln -s ${SHELL_PATH}/config/sway	${HOME}/.config/sway
# Waybar
mkdir -p ${HOME}/.config/waybar
ln -s ${SHELL_PATH}/config/waybar ${HOME}/.config/waybar
# Alacritty
mkdir -p ${HOME}/.config/alacritty
ln -s ${SHELL_PATH}/config/alacritty ${HOME}/.config/alacritty


