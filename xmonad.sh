#!/usr/bin/sh
# Defining the shell path and global variables 
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/bin/global.sh

info "Setting up X11"
install ${SHELL_PATH}/data/xorg.list

info "Setting up Xmonad"
install ${SHELL_PATH}/data/xmonad.list

info "Setting up My Applications"
install ${SHELL_PATH}/data/myapps.list

info "Setting up Fonts"
install ${SHELL_PATH}/data/myfonts.list

info "XOrg Configuration"
ln -s ${SHELL_PATH}/config/xorg/.Xauthority $HOME/.Xauthority
ln -s ${SHELL_PATH}/config/xorg/.xinitrc $HOME/.xinitrc 

info "Alacrity Configuration"
ln -s ${SHELL_PATH}/config/alacritty $HOME/.config/

info "Automatic Brightness Control"
sudo cp ${SHELL_PATH}/scripts/abc /usr/bin

info "Xmonand Configuration"
mkdir -p $HOME/.xmonad
ln -s ${SHELL_PATH}/config/xmonad/xmonad.hs $HOME/.xmonad/xmonad.hs

info "Xmobar Configuration"
mkdir -p $HOME/.config/xmobar
ln -s ${SHELL_PATH}/config/xmobar $HOME/.config/xmobar
