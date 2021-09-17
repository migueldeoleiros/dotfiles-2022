#   _               _
#  | |__   __ _ ___| |__  _ __ ___
#  | '_ \ / _` / __| '_ \| '__/ __|
# _| |_) | (_| \__ \ | | | | | (__
#(_)_.__/ \__,_|___/_| |_|_|  \___|


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\[\033[38;5;34m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;201m\]>\[$(tput sgr0)\]\[\033[38;5;226m\]>\[$(tput sgr0)\] "

#PATH
export PATH=/home/miguel/.scripts:$PATH

#basic setup
shopt -s autocd

#run at start 
#pfetch | lolcat -h 0.8 

#aliases
source $HOME/.alias

#z jump around
. ~/programs/z/z.sh

#insults you
if [ -f /etc/bash.command-not-found ]; then
	. /etc/bash.command-not-found
fi

#fzf
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.bash
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.bash
export FZF_DEFAULT_OPS="--extended"
# export FZF_DEFAULT_COMMAND="fzf --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
