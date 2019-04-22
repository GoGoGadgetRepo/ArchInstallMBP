#

# Colour Varaibles
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${green}Formatting the drivers...${reset}"
mkfs.vfat -F32 /dev/sda1
mkfs.f2fs -f -l main /dev/sda2

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
pacstrap /mnt base base-devel vim intel-ucode sudo networkmanager wpa_supplicant neofetch git alsa-utils sway wlroots wayland swaylock swayidle termite xorg-server-xwayland pulseaudio-alsa ttf-Liberation rofi lxapperance

echo "${green}Generating fstab for the drives.${reset}"
genfstab -L -p /mnt >> /mnt/etc/fstab

