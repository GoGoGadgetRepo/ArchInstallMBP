#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/scripts/global.sh

info "Enabling/Starting Network Manager with 30sec WAIT"
sudo systemctl enable NetworkManager 
sudo systemctl start NetworkManager

sleep 10

info "Enabling Wifi based on User Choice"
nmcli device wifi
info "Please select the Wifi to connect to you. Type the name"
read SSID
info "Please provide the password for ${SSID}"
read password
nmcli dev wifi connect ${SSID} password ${password} 


sleep 10

info "Installing Reflector to find the best mirror list for downloading."
sudo pacman -Sy --noconfirm reflector
sudo cp /etc/pacman.d/mirrorlist  /etc/pacman.d/mirrorlist.backup
sudo reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

info "Enabling Network Manager"
sudo systemctl enable NetworkManager-dispatcher.service
sudo systemctl start NetworkManager-dispatcher.service

sleep 5

info "Installing pikaur"
export PACK=PIKAUR
sudo pacman --noconfirm -S cmake clang
mkdir /tmp/$PACK 
git clone https://aur.archlinux.org/pikaur.git /tmp/$PACK
cd /tmp/$PACK
makepkg -fsri

info "Installing Missing Firmware and Update Linux Kernel"
pikaur --noconfirm -S wd719x-firmware aic94xx-firmware bcwc-pcie-git
sudo mkinitcpio -p linux

info "Installing Utilities"
sudo pacman --noconfirm -S zsh man pacman-contrib zsh-syntax-highlighting htop nnn vlc youtube-dl lm_sensors unzip ttf-liberation imv bat zsh-theme-powerlevel10k fzf


info "Applying custom settings."
sh ${SHELL_PATH}/settings.sh

