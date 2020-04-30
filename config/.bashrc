#
# ~/.bashrc
#

brown=`tput setaf 1`
green=`tput setaf 2`
orange=`tput setaf 3`
blue=`tput setaf 4`
grey=`tput setaf 0`
pink=`tput setaf 5`
lblue=`tput setaf 6`
reset=`tput setaf 15`

shopt -s autocd
shopt -s cdspell
shopt -s direxpand
shopt -s dirspell
shopt -s expand_aliases

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.profile

#PS1='[\u@\h \W]\$ '
PS1='${orange}\u${grey}@${green}\H${lblue}[ \w ] ${green}\d \n${pink}\T (\!)\$ ${reset}'
