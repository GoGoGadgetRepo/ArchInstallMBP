#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/scripts/global.sh

echo "${green}**************************************************"
echo "**  Enabling/Starting Network Manager with 30sec WAIT"
echo "**************************************************${reset}"
sudo systemctl enable NetworkManager 
sudo systemctl start NetworkManager

sleep 15

echo "${green}**************************************************"
echo "Enabling Wifi based on User Choice"
echo "**************************************************${reset}"
nmcli device wifi
echo "${green}Please select the Wifi to connect to you. Type the name${reset}"
read SSID
echo "${green}Please provide the password for ${SSID}${reset}"
read password
nmcli dev wifi connect ${SSID} password ${password} 

echo "${green}Installing Reflector to find the best mirror list for downloading Arch Linux${reset}"
pacman -Sy --noconfirm reflector
cp /etc/pacman.d/mirrorlist  /etc/pacman.d/mirrorlist.backup
reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

echo "${green}**************************************************"
echo "Enabling Network Manager"
echo "**************************************************${reset}"
sudo systemctl enable NetworkManager-dispatcher.service
sudo systemctl start NetworkManager-dispatcher.service

echo "${green}**************************************************"
echo "Installing and Enabling CPUpower & fstrim."
echo "**************************************************${reset}"
sudo pacman --noconfirm -S cpupower 
sudo systemctl enable cpupower
sudo systemctl start cpupower
sudo cpupower frequency-set -g powersave

sudo systemctl enable fstrim.timer

echo "${green}**************************************************"
echo "Installing pikaur"
echo "**************************************************${reset}"
export PACK=PIKAUR
sudo pacman --noconfirm -S cmake clang
mkdir $HOME/$PACK 
git clone https://aur.archlinux.org/pikaur.git $HOME/$PACK
cd $HOME/$PACK
makepkg -fsri


#echo "${green}**************************************************"
#echo "Enabling Power Management with laptop-mode-tools"
#echo "**************************************************${reset}"
sudo pacman --noconfirm -S acpid
sudo systemctl enable acpid.service
sudo systemctl start acpid.service
pikaur --noconfirm -S laptop-mode-tools
sudo systemctl enable laptop-mode.service
sudo systemctl start laptop-mode.service

#echo "${green}**************************************************"
#echo "Enabling fans for the MacbookPro"
#echo "**************************************************${reset}"
#pikaur --noconfirm -S mbpfan-git kbdlight
#sudo cp mbpfan.conf /etc/
#sudo systemctl enable mbpfan
#sudo systemctl start mbpfan


#echo "${green}**************************************************"
#echo "Enabling fans for the MacbookPro"
#echo "**************************************************${reset}"
#pikaur --noconfirm -S thermald
#sudo systemctl enable thermald
#sudo systemctl start thermald

echo "${green}**************************************************"
echo "*** Installing Missing Firmware and Update Linux Kernel"
echo "**************************************************${reset}"
sudo pacman --noconfirm -S linux-headers
pikaur --noconfirm -S wd719x-firmware aic94xx-firmware bcwc-pcie-git
sudo mkinitcpio -p linux
#sudo mkinitcpio -p linux-zen
#sudo mkinitcpio -p linux-lts

#echo "**************************************************"
#echo "*** Utilties"
#echo "**************************************************"
sudo pacman --noconfirm -S zsh man pacman-contrib zsh-syntax-highlighting htop

echo "${green}Applying custom settings.${reset}"
sh settings.sh

echo "**************************************************"
echo "*** GUI Utilties"
echo "**************************************************"
sudo pacman --noconfirm -S nnn hunspell-en_GB arc-gtk-theme vlc youtube-dl
sudo pacman --noconfirm -S unzip lm_sensors 
sudo pacman --noconfirm -S ttf-liberation lxappearance 
