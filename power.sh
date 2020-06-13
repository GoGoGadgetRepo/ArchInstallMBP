sudo pacman -S tlp tlp-rdw 
sudo pacman -S tpacpi-bat

sudo systemctl enable tlp.service
sudo systemctl start tlp.service

sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd.rfkill.socket
