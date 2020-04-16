
source $XDG_CONFIG_HOME/profile
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz compinit promptinit colors zsh/terminfo vcs_info
compinit
promptinit
colors
precmd() { vcs_info }

zstyle ':completion::complete:*' gain-privileges 1
zstyle ':vcs_info:git:*' formats '%b '

setopt COMPLETE_ALIASES
setopt correctall
setopt hist_ignore_all_dups
setopt autocd
setopt PROMPT_SUBST


PROMPT='${PWD/#$HOME/~} > '
RPROMPT=\$vcs_info_msg_0_


#---------------------------------------------------
# History Stuff
# --------------------------------------------------
HISTFILE=$XDG_CONFIG_HOME/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000


#---------------------------------------------------
# Keybinding
# --------------------------------------------------
bindkey -v

#------------------------------
# ShellFuncs
#------------------------------
# -- coloured manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}


#source $XDG_CONFIG_HOME/sway/autoStart
