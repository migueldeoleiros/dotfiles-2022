# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\u@\h \W:\$ '

#basic aliases
alias sudo='sudo '
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias df='df -h'
alias ..='cd ..'
alias ...='cd ../..'
alias vim='nvim'

#ls aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias lla='ls -la'
alias la='ls -A'

#doom
alias doom='/home/miguel/.emacs.d/bin/doom'

#git aliases
alias gitc='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

#void linux
alias xi='xbps-install'
alias xr='xbps-remove'
alias xq='xbps-query'

#change wallpaper on i3 config
alias wallpaper='. /Wallpaper/.i3_wallpapers.sh'

