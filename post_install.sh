sudo systemctl start NetworkManager

sleep 30

echo "**************************************************"
echo "Connecting to Wifi"
echo "**************************************************"
nmcli dev wifi connect <SSID> password <password>
echo "**************************************************"
echo "Installing & Enabling Power & Thermal."
echo "**************************************************"
sudo pacman --noconfirm -S tlp tlp-sleep cpupower util-linux
sudo systemctl enable tlp tlp-sleep
sudo systemctl start tlp

sudo systemctl enable cpupower
sudo systemctl start cpupower
sudo cpupower frequency-set -g powersave

sudo systemctl enable fstrim.timer

echo "**************************************************"
echo "Installing pikaur"
echo "**************************************************"
export PACK=PIKAUR
sudo pacman --noconfirm -S cmake clang
mkdir $HOME/$PACK 
git clone https://aur.archlinux.org/pikaur.git $HOME/$PACK
cd $HOME/$PACK
makepkg -fsri
cd /backup

echo "**************************************************"
echo "Enabling fans for the MacbookPro"
echo "**************************************************"
pikaur --noconfirm -S mbpfan-git kbdlight
sudo cp mbpfan.conf /etc/
sudo systemctl enable mbpfan
sudo systemctl start mbpfan


echo "**************************************************"
echo "Enabling fans for the MacbookPro"
echo "**************************************************"
pikaur --noconfirm -S thermald
sudo systemctl enable thermald
sudo systemctl start thermald

echo "**************************************************"
echo "Setting Audio"
echo "**************************************************"
#sudo pacman --noconfirm -S xf86-video-intel vulkan-intel wayland  sway  xorg-server-xwayland
sudo pacman --noconfirm -S alsa-utils pulseaudio-alsa

echo "**************************************************"
echo "*** Moving Configurations"
echo "**************************************************"
mkdir -p $HOME/.config/sway
mkdir -p $HOME/.config/termite
# mkdir -p $HOME/.vim
mkdir -p $HOME/Pictures/Wallpaper


echo "**************************************************"
echo "*** Copying Configurations"
echo "**************************************************"
cp config/sway/config $HOME/.config/sway/
# cp /backup/config/vim/vimrc $HOME/.vim/
cp config/wallpaper/wp.png $HOME/Pictures/Wallpaper/
cp config/termite/config $HOME/.config/termite/


echo "**************************************************"
echo "*** GUI Utilties"
echo "**************************************************"
sudo pacman --noconfirm -S nnn hunspell-en_GB arc-gtk-theme vlc youtube-dl
sudo pacman --noconfirm -S playerctl light unzip lm_sensors 
sudo pacman --noconfirm -S ttf-liberation rofi lxappearance 
