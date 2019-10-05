#!/usr/bin/bash

SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/global.sh

echo "${orange}============================================================================"
echo "== Syncing Configurations..."
echo "============================================================================${reset}"

echo "${green}Bash Configuration ${reset}"
cp ${HOME}/.bashrc ${SHELL_PATH}/../config/
cp ${HOME}/.profile ${SHELL_PATH}/../config/

echo "${green}Sway Configuration ${reset}"
cp ${HOME}/.config/sway/config ${SHELL_PATH}/../config/sway/

echo "${green}Termite Configuration ${reset}"
cp ${HOME}/.config/termite/config ${SHELL_PATH}/../config/termite/ 

echo "${green}Neofetch Configuration ${reset}"
cp ${HOME}/.config/neofetch/config.conf ${SHELL_PATH}/../config/neofetch/ 

#echo "${green}DONE!"
#echo "${orange}Please check for any errors before proceeding.${reset}"

echo "${orange}============================================================================${reset}"
