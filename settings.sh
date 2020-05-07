#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/config/profile
source ${SHELL_PATH}/scripts/global.sh

# Ensuring the Configuration Directory is present
mkdir -p $HOME/.config

info "Applying Global Configuration"
sudo cp ${SHELL_PATH}/config/zsh/zshenv /etc/zsh/

info "User level Configurations"
ln -s ${SHELL_PATH}/config/profile $HOME/.config/profile

info "ZSH Configuration"
ln -s ${SHELL_PATH}/config/zsh ${HOME}/.config/zsh
sudo chsh -s /bin/zsh ${USER}

info "Neovim Configuration"
ln -s ${SHELL_PATH}/config/nvim ${HOME}/.config/nvim
