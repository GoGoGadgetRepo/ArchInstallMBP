#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/config/profile
source ${SHELL_PATH}/bin/global.sh

# Ensuring the Configuration Directory is present
mkdir -p $HOME/.config

ln -s ${SHELL_PATH}/bin $HOME/bin

info "Applying Global Configuration"
sudo cp ${SHELL_PATH}/config/zsh/zshenv /etc/zsh/

info "User level Configurations"
ln -s ${SHELL_PATH}/config/profile $HOME/.config/profile

info "ZSH Configuration"
ln -s ${SHELL_PATH}/config/zsh ${HOME}/.config
sudo chsh -s /bin/zsh ${USER}

info "Neovim Configuration"
ln -s ${SHELL_PATH}/config/nvim ${HOME}/.config/

info "Rofi Configuration"
ln -s ${SHELL_PATH}/config/rofi ${HOME}/.config/

info "NetworkManager Configuration"
sudo cp ${SHELL_PATH}/config/etc/NetworkManager.conf /etc/NetworkManager/ 

info "Grub Configurations"
sudo pacman -S --noconfirm grub-theme-vimix
sudo cp ${SHELL_PATH}/config/grub/grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg

info "Reducing Entropy"
sudo pacman -S --noconfirm haveged
sudo systemctl enable haveged
sudo systemctl start haveged
