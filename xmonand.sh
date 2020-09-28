#!/usr/bin/sh
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/scripts/global.sh

info "Installing Packages for Xmonad"
sudo pacman --noconfirm -Syu xmonad xmonad-contrib	# Basic Package	 
sudo pacman --noconfirm -Syu xterm dmenu			# Required for  

info "Installing video drivers for XOrg"
sudo pacman --noconfirm -Syu xf86-video-fbdev xf86-video-intel xf86-video-vesa
sudo pacman --noconfirm -Syu xorg xorg-xinit picom
sudo pacman --noconfirm -Syu xorg xinit picom
sudo pacman --noconfirm -Syu xmobar alacritty

info "Alacrity Configuration"
ln -s ${SHELL_PATH}/config/alacritty $HOME/.config/

info "Automatic Brightness Control"
sudo cp ${SHELL_PATH}/scripts/abc /usr/bin

sudo pacman --noconfirm -Syu ttf-ubuntu-font-family xdotool rofi
