# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

################################################################################
# Path Variable
################################################################################
export PATH=$HOME/Scripts:$HOME/.local/bin:$PATH

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

################################################################################
# Auto-start Sway
################################################################################
source $XDG_CONFIG_HOME/sway/autoStart

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/Repo/ArchInstallMBP/config/zsh/.p10k.zsh.
[[ ! -f ~/Repo/ArchInstallMBP/config/zsh/.p10k.zsh ]] || source ~/Repo/ArchInstallMBP/config/zsh/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
