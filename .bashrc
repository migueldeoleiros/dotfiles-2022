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

#basic aliases
alias sudosu='sudo -Es'
alias sudo='sudo '
alias poweroff='sudo poweroff'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias df='df -h'
alias ..='cd ..'
alias ...='cd ../..'
alias vim='nvim'

#improved find
alias find='fd'

#process check
alias psuser='ps -u miguel'

#ls aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias lla='ls -la'
alias la='ls -A'

#open programs
alias op='xdg-open'

#doom
alias doom='/home/miguel/.emacs.d/bin/doom'

#git aliases
alias gitc='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

#void linux
alias xin='xbps-install'
alias xre='xbps-remove'
alias xqu='xbps-query'
alias xbps-src='. ~/void-packages/xbps-src'
alias xbps="xbps-query -Rl | fzf -e --height 40% --layout=reverse --border | xargs -ro sudo xbps-install -S"

#Bedrock linux
alias v='strat -r void'
alias a='strat -r arch'

#z jump around
. ~/programs/z/z.sh

#fzf fuzzy finder
source /usr/share/doc/fzf/key-bindings.bash
source /usr/share/doc/fzf/completion.bash
