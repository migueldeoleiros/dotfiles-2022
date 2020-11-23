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

#fzf fuzzy finder
source /usr/share/doc/fzf/key-bindings.bash
source /usr/share/doc/fzf/completion.bash
