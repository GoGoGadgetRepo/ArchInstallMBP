#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/scripts/global.sh

# Please make changes to the drive based on your hardware configuration
info "Formatting the drivers..."
mkfs.vfat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
#mkswap /dev/sda3
#swapon /dev/sda3

info "Mounting the drives 1. Root, 2. Boot "
mount /dev/sda2 /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount /dev/sda1 /mnt/boot
mount /dev/sda3 /mnt/home
lsblk

info "Installing Reflector to find the best mirror list for downloading Arch Linux"
pacman -Sy --noconfirm reflector
cp /etc/pacman.d/mirrorlist  /etc/pacman.d/mirrorlist.backup
reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

info "Installing all packages to get sway under wayland working with audio. Some additional useful packages are included also."
pacstrap /mnt base base-devel vim neovim intel-ucode sudo networkmanager wpa_supplicant git alsa-utils pulseaudio-alsa coreutils dosfstools util-linux exa linux linux-firmware linux-headers linux-lts linux-lts-headers

info "Generating fstab for the drives."
genfstab -L -p /mnt >> /mnt/etc/fstab

info "Creating RAM Disk."
echo "tmpfs	/tmp	tmpfs	rw,nodev,nosuid,size=4G	0 0" >> /mnt/etc/fstab


info "Copying install scripts to new location"
cp -R ${SHELL_PATH} /mnt/
info "Entering as root into Arch Linux Install Drive"
info "You need to run install.sh to set all configurations for arch Linux system and Macbook Pro settings."
arch-chroot /mnt

umount -R /mnt

