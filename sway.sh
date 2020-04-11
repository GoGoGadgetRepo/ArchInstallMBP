#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)

echo "${green}**************************************************"
echo "*** Installing Packages for Sway"
echo "**************************************************${reset}"

sudo pacman -S sway waybar ttf-liberation 
sudo pacman -Syu xorg-server-xwayland   #Backward Compatiblity with X11
#sudo pacman -Syu lxapperance  # Customization of GTK+
sudo pacman -S kitty mako awesome awesome-terminal-fonts firefox brightnessctl

sudo pikaur -S wofi

echo "${green}**************************************************"
echo "*** Moving Configurations"
echo " 1 - Sway"
echo " 2 - Termite (Terminal Emulator)"
echo "**************************************************${reset}"
mkdir -p ${HOME}/.config/sway
cp ${SHELL_PATH}/config/sway/config ${HOME}/.config/sway/
sudo echo "MOZ_ENABLE_WAYLAND=1" >> /etc/environment   
