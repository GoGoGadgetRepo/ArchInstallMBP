#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/config/profile
source ${SHELL_PATH}/scripts/global.sh

info "Applying Global Configuration"
sudo cp ${SHELL_PATH}/config/zsh/zshenv /etc/zsh/


info "User level Configurations"
mkdir -p $HOME/.config
ln -s ${SHELL_PATH}/config/profile $HOME/.config/profile

info "ZSH Configuration"
mkdir -p $HOME/.config/zsh
ln -s ${SHELL_PATH}/config/zsh/.zshrc ${HOME}/.config/zsh/.zshrc

sudo chsh -s /bin/zsh ${USER}

#info "VIM Configuration"
#mkdir -p ${XDG_DATA_HOME}/vim/{undo,swap,backup}
#mkdir -p ${HOME}/.config/vim
#ln -s ${SHELL_PATH}/config/vim/vimrc ${HOME}/.config/vim/vimrc

info "Neovim Configuration"
mkdir -p ${XDG_CONFIG_HOME}/nvim
ln -s ${SHELL_PATH}/config/nvim/init.vim ${HOME}/.config/init.vim
