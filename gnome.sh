
sudo pacman --noconfirm -Syu gnome gnome-extra gnome-tweaks gdm

gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

sudo systemctl enable gdm
sudo systemctl start gdm
