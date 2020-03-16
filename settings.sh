#!/usr/bin/bash
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/scripts/global.sh

echo "${green}**************************************************"
echo "**  Applying Global Configuration"
echo "**************************************************${reset}"
sudo cp ${SHELL_PATH}/config/zsh/zshenv /etc/zsh/


echo "${green}**************************************************"
echo "**  User level Configurations"
echo "**************************************************${reset}"
mkdir -p $HOME/.config
cp ${SHELL_PATH}/config/profile $HOME/.config/profile

mkdir -p $HOME/.config/zsh
cp ${SHELL_PATH}/config/zsh/.zshrc ${HOME}/.config/zsh/

sudo chsh -s /bin/zsh masroor
