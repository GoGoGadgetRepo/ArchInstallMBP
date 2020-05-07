
################################################################################
# Loading Personal Preferences 
################################################################################
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

################################################################################
# History Stuff
################################################################################
HISTFILE=$XDG_CONFIG_HOME/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000


################################################################################
# Key binding
################################################################################
bindkey -v

source $XDG_CONFIG_HOME/sway/autoStart
