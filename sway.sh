echo "${green}**************************************************"
echo "*** Installing Packages for Sway"
echo "**************************************************${reset}"

sudo pacman -S sway wlroots wayland swaylock swayidle waybar ttf-Liberation
sudo pacman -Syu xorg-server-xwayland   #Backward Compatiblity with X11
sudo pacman -Syu lxapperance  # Customization of GTK+
sudo pacman -S termite rofi

echo "${green}**************************************************"
echo "*** Moving Configurations"
echo " 1 - Sway"
echo " 2 - Termite (Terminal Emulator)"
echo "**************************************************${reset}"
mkdir -p $HOME/.config/sway/
mkdir -p $HOME/.config/termite/
#
