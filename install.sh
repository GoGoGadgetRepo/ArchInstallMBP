#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/scripts/global.sh

info "Setting Time zone and Time"
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc --utc

info "Setting system wide language"
sed -i '/en_GB.UTF-8'/s/^#//g /etc/locale.gen
locale-gen
cp ${SHELL_PATH}/config/etc/locale.conf /etc/

info "Setting font for vconsole"
cp ${SHELL_PATH}/config/etc/vconsole.conf /etc/

info "Setting machine name."
echo Freedom > /etc/hostname

info "Copying the modules to /etc/"
cp ${SHELL_PATH}/config/etc/modules /etc/

info "Setting environment variables for Wayland"
cp ${SHELL_PATH}//config/etc/environment /etc/

info "Giving user wheel access"
sed -i '/%wheel ALL=(ALL) NOPASSWD: ALL'/s/^#//g /etc/sudoers

# systemd-boot Configurations
#info "Making bootable drive and configurations"
#bootctl --path=/boot install
#cp ${SHELL_PATH}/config/boot/arch.conf /boot/loader/entries/
#cp ${SHELL_PATH}/config/boot/lts.conf /boot/loader/entries/
#cp ${SHELL_PATH}/config/boot/loader.conf /boot/loader/

#info "Setting the sound card index to PCA"
#cp ${SHELL_PATH}/config/modprobe/snd_hda_intel.conf /etc/modprobe.d/
#cp ${SHELL_PATH}/config/modprobe/i915.conf /etc/modprobe.d/
#cp ${SHELL_PATH}/config/modprobe/hid_apple.conf /etc/modprobe.d/
#cp ${SHELL_PATH}/config/modprobe/xhci_reset_on_suspend.conf /etc/modprobe.d/

sed -i '/Color'/s/^#//g /etc/pacman.conf

info "Type the the username for this installation:"
read USERNAME
useradd -m -g users -G wheel -s /bin/bash ${USERNAME}
info "Password for the user ${USERNAME}"
passwd ${USERNAME}
info "Password for root"
passwd

info "Adding the ${USERNAME} to the video group."
usermod -aG mail ${USERNAME}
usermod -aG ftp ${USERNAME}
usermod -aG audio ${USERNAME}
usermod -aG git ${USERNAME}
usermod -aG adm ${USERNAME}
usermod -aG video ${USERNAME}

#bootctl set-default lts.conf
#bootctl list


info "Setting boot icon."
pacman -S wget librsvg libicns
wget -O /tmp/archlinux.svg https://www.archlinux.org/logos/archlinux-icon-crystal-64.svg
rsvg-convert -w 128 -h 128 -o /tmp/archlogo.png /tmp/archlinux.svg
png2icns /boot/.VolumeIcon.icns /tmp/archlogo.png
rm /tmp/archlogo.png
rm /tmp/archlinux.svg


info "Making bootable drive and configurations"
pacman -S grub efibootmgr

mkdir -p /boot/efi
mount /dev/sda1 /boot/efi

grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg


sudo systemctl enable NetworkManager 


info "The system will shutdown in 5 seconds. Run post_install.sh after restart."


