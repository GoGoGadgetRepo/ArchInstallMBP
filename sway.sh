#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)

echo "${green}**************************************************"
echo "*** Installing Packages for Sway"
echo "**************************************************${reset}"

sudo pacman -S sway waybar ttf-liberation 
sudo pacman -Syu xorg-server-xwayland   #Backward Compatiblity with X11
#sudo pacman -Syu lxapperance  # Customization of GTK+
sudo pacman -S termite mako awesome  awesome-terminal-fonts rofi firefox

echo "${green}**************************************************"
echo "*** Moving Configurations"
echo " 1 - Sway"
echo " 2 - Termite (Terminal Emulator)"
echo "**************************************************${reset}"
mkdir ${HOME}/.config/sway
cp ${SHELL_PATH}/config/sway/config ${HOME}/.config/sway/
