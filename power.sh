

info "Installing and Enabling CPUpower & fstrim."
sudo pacman --noconfirm -S cpupower 
sudo cpupower frequency-set -g powersave
sudo systemctl enable cpupower
sudo systemctl start cpupower

sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

info "Enabling Power Management with laptop-mode-tools"
sudo pacman --noconfirm -S acpid acpi acpi_call
sudo systemctl enable acpid.service
sudo systemctl start acpid.service

info "Installing Thermald"
pikaur --noconfirm -S thermald
sudo systemctl enable thermald
sudo systemctl start thermald

info "Installing laptop-mode-tools"
pikaur --noconfirm -S laptop-mode-tools
sudo systemctl enable laptop-mode.service
sudo systemctl start laptop-mode.service

info "Enabling fans for the Macbook Pro"
pikaur --noconfirm -S mbpfan-git
sudo cp ${SHELL_PATH}/config/etc/mbpfan.conf /etc/
sudo systemctl enable mbpfan
sudo systemctl start mbpfan


