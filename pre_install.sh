#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/scripts/global.sh

# Please make changes to the drive based on your hardware configuration
echo "${green}Formatting the drivers...${reset}"
mkfs.vfat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

echo "${green}Mounting the drives${reset}"
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
lsblk

echo "${green}Installing Reflector to find the best mirror list for downloading Arch Linux${reset}"
pacman -Sy --noconfirm reflector
cp /etc/pacman.d/mirrorlist  /etc/pacman.d/mirrorlist.backup
reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

echo "${green}Installing all packages to get sway under wayland working with audio. Some additional useful packages are included also.${reset}"
pacstrap /mnt base base-devel vim intel-ucode sudo networkmanager wpa_supplicant neofetch git alsa-utils sway wlroots wayland swaylock swayidle termite pulseaudio-alsa rofi linux-lts waybar linux 

# Packages for backward compatibility
# xorg-server-xwayland ttf-Liberation  lxapperance 

echo "${green}Generating fstab for the drives.${reset}"
genfstab -L -p /mnt >> /mnt/etc/fstab

# Copying install scripts to new location
cd /mnt 
git clone https://github.com/GoGoGadgetRepo/ArchInstallMBP
echo "${green} ==============================================================="
echo " =  Entering as root into Arch Linux Install Drive "
echo " =  You need to run install.sh to set all configurations for"
echo " =  arch Linux system and Macbook Pro settings."
echo "  ===============================================================${reset}"
arch-chroot /mnt

