#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/scripts/global.sh

info "Applying Global Configuration"
sudo cp ${SHELL_PATH}/config/zsh/zshenv /etc/zsh/


info "User level Configurations"
mkdir -p $HOME/.config
ln -s ${SHELL_PATH}/config/profile $HOME/.config/profile

mkdir -p $HOME/.config/zsh
ln -s ${SHELL_PATH}/config/zsh/.zshrc ${HOME}/.config/zsh/.zshrc

sudo chsh -s /bin/zsh ${USER}
