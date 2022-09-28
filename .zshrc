#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|

#login script
source $HOME/.scripts/startMenu/startMenu.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b >>'

#PATH
export PATH=/home/miguel/.scripts:$PATH
export PATH=/home/miguel/.local/bin:$PATH
export PATH=/home/miguel/.doom.d/bin:$PATH

#Android
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# History
setopt append_history inc_append_history share_history histignorealldups
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

#EMACS
export ALTERNATE_EDITOR=""

#run at start 
. ranger > /dev/null 2>&1
. ranger > /dev/null 2>&1
#pfetch | lolcat -h 0.8 

#autostart tmux
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

#vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

#aliases
source $HOME/.alias

#z jump around
. ~/programs/z/z.sh

#insults you
if [ -f /etc/bash.command-not-found ]; then
	. /etc/bash.command-not-found
fi

#fzf
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
export FZF_DEFAULT_OPS="--extended"
# export FZF_DEFAULT_COMMAND="fzf --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#zsh plugins
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship Prompt
eval "$(starship init zsh)"

