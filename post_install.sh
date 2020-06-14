#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/scripts/global.sh

info "Enabling/Starting Network Manager with 30sec WAIT"
sudo systemctl enable NetworkManager 
sudo systemctl start NetworkManager

sleep 15

info "Enabling Wifi based on User Choice"
nmcli device wifi
info "Please select the Wifi to connect to you. Type the name"
read SSID
info "Please provide the password for ${SSID}"
read password
nmcli dev wifi connect ${SSID} password ${password} 

info "Installing Reflector to find the best mirror list for downloading Arch Linux"
pacman -Sy --noconfirm reflector
cp /etc/pacman.d/mirrorlist  /etc/pacman.d/mirrorlist.backup
reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

info "Enabling Network Manager"
sudo systemctl enable NetworkManager-dispatcher.service
sudo systemctl start NetworkManager-dispatcher.service

info "Installing and Enabling CPUpower & fstrim."
sudo pacman --noconfirm -S cpupower 
sudo cpupower frequency-set -g powersave
sudo systemctl enable cpupower
sudo systemctl start cpupower

sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

info "Enabling Power Management with laptop-mode-tools"
sudo pacman --noconfirm -S acpid acpi acpi_call
sudo systemctl enable acpid.service
sudo systemctl start acpid.service


info "Installing pikaur"
export PACK=PIKAUR
sudo pacman --noconfirm -S cmake clang
mkdir /tmp/$PACK 
git clone https://aur.archlinux.org/pikaur.git /tmp/$PACK
cd /tmp/$PACK
makepkg -fsri

info "Installing Thermald"
pikaur --noconfirm -S thermald
sudo systemctl enable thermald
sudo systemctl start thermald

info "Installing laptop-mode-tools"
pikaur --noconfirm -S laptop-mode-tools
sudo systemctl enable laptop-mode.service
sudo systemctl start laptop-mode.service

info "Enabling fans for the Macbook Pro"
pikaur --noconfirm -S mbpfan kbdlight
sudo cp ${SHELL_PATH}/config/etc/mbpfan.conf /etc/
sudo systemctl enable mbpfan
sudo systemctl start mbpfan

info "Installing Missing Firmware and Update Linux Kernel"
pikaur --noconfirm -S wd719x-firmware aic94xx-firmware bcwc-pcie-git
sudo mkinitcpio -p linux

info "Installing Utilities"
sudo pacman --noconfirm -S zsh man pacman-contrib zsh-syntax-highlighting htop nnn vlc youtube-dl lm_sensors unzip ttf-liberation imv

info "Applying custom settings."
sh ${SHELL_PATH}/settings.sh

