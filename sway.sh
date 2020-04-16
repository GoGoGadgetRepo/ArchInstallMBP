#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)

info "Installing Packages for Sway"

sudo pacman --noconfirm -Syu sway waybar ttf-liberation 
sudo pacman -Syu xorg-server-xwayland   #Backward Compatiblity with X11
sudo pacman -Syu lxapperance  # Customization of GTK+
sudo pacman --noconfirm -Syu kitty mako awesome awesome-terminal-fonts firefox brightnessctl

info "Setting pacakges that enable wayland GUI"
sudo pacman --noconfirm -S qt5-wayland glfw-wayland glew-wayland clutter
info "Installing wayland compatible launcher"
sudo pikaur --noconfirm -S wofi

info "Moving Configurations"
mkdir -p ${HOME}/.config/sway
ln -s ${SHELL_PATH}/config/sway/config ${HOME}/.config/sway/config
ln -s ${SHELL_PATH}/config/sway/autoStart  ${HOME}/.config/sway/autoStart

mkdir -p ${HOME}/.config/waybar
ln -s ${SHELL_PATH}/config/waybar/config ${HOME}/.config/waybar/config
ln -s ${SHELL_PATH}/config/waybar/style.css ${HOME}/.config/waybar/style.css

#sudo echo "MOZ_ENABLE_WAYLAND=1" >> /etc/environment   
