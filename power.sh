

info "Installing and Enabling CPUpower & fstrim."
sudo pacman --noconfirm -S cpupower 
sudo cpupower frequency-set -g powersave
sudo sh -c "echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo"
sudo systemctl enable cpupower
sudo systemctl start cpupower

sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

info "TLP"
sudo pacman --noconfirm -S tlp tlp-rdw smartmontools ethtool lm_sensors
sudo systemctl enable tlp
sudo systemctl start tlp
sudo sensors-detect
sudo sensors

info "Enabling Power Management with laptop-mode-tools"
sudo pacman --noconfirm -S acpid acpi acpi_call
sudo systemctl enable acpid.service
sudo systemctl start acpid.service

info "Installing Thermald"
pikaur --noconfirm -S thermald
sudo systemctl enable thermald
sudo systemctl start thermald

info "Enabling fans for the Macbook Pro"
pikaur --noconfirm -S mbpfan-git
sudo cp ${SHELL_PATH}/config/etc/mbpfan.conf /etc/
sudo systemctl enable mbpfan
sudo systemctl start mbpfan

info "Enabling Powertop"
sudo pacman --noconfirm -S powertop 

sudo sh -c "echo 'med_power_with_dipm' >  /sys/class/scsi_host/host0/link_power_management_policy"
sudo sh -c "echo 1 >  /sys/module/snd_hda_intel/parameters/power_save"
sudo sh -c "echo '1500' > /proc/sys/vm/dirty_writeback_centisecs"
sudo sh -c "echo 'auto' >  /sys/bus/usb/devices/1-12/power/control"
sudo sh -c "echo 'auto' >  /sys/bus/usb/devices/2-4/power/control"

sudo sh -c "echo 'enabled' >  /sys/bus/usb/devices/usb1/power/wakeup"
sudo sh -c "echo 'enabled' >  /sys/bus/usb/devices/2-4/power/wakeup"
sudo sh -c "echo 'enabled' >  /sys/bus/usb/devices/usb2/power/wakeup"

