#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/scripts/global.sh

echo "${green}Setting Time zone and Time${reset}"
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc --utc

echo "${green}Setting system wide language${reset}"
sed -i '/en_GB.UTF-8'/s/^#//g /etc/locale.gen
locale-gen
cp ${SHELL_PATH}/config/locale.conf /etc/

echo "${green}Setting font for vconsole${reset}"
cp ${SHELL_PATH}/config/vconsole.conf /etc/

echo "${green}Setting machine name.${reset}"
echo Freedom > /etc/hostname

echo "${green}Copying the modules to /etc/${reset}"
cp ${SHELL_PATH}/config/modules /etc/

echo "${green}Giving user wheel access${reset}"
sed -i '/%wheel ALL=(ALL) NOPASSWD: ALL'/s/^#//g /etc/sudoers

# systemd-boot Configurations
echo "${green}Making bootable drive and configurations${reset}"
bootctl --path=/boot install
cp ${SHELL_PATH}/config/arch.conf /boot/loader/entries/
#cp lts.conf /boot/loader/entries/
cp ${SHELL_PATH}/config/loader.conf /boot/loader/

echo "${green}Setting the sound card index to PCA${reset}"
cp ${SHELL_PATH}/config/snd_hda_intel.conf /etc/modprobe.d/
cp ${SHELL_PATH}/config/hid_apple.conf /etc/modprobe.d/

sed -i '/Color'/s/^#//g /etc/pacman.conf


useradd -m -g users -G wheel -s /bin/bash masroor
echo "${green}Password for the user masroor${reset}"
passwd masroor
echo "${green}Password for root${reset}"
passwd


