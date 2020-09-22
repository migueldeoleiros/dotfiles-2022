# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias doom='/home/miguel/.emacs.d/bin/doom'
alias gitc='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias vim='nvim'
alias lsa='ls -A'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias df='df -h'
alias ..='cd ..'
alias ...='cd ../..'

#void linux
alias xi='xbps-install'
alias xr='xbps-remove'
alias xq='xbps-query'
