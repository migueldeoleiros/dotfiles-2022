#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b >>'

#PATH
export PATH=/home/miguel/.scripts:$PATH

#run at start 
#pfetch | lolcat -h 0.8 

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

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

#youtube on comand line
alias yt='mpsyt'

#z jump around
. ~/programs/z/z.sh

#fzf fuzzy finder
source /usr/share/doc/fzf/key-bindings.zsh
source /usr/share/doc/fzf/completion.zsh

#zsh plugins
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_DOCKER_CONTEXT_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_CONDA_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_JOBS_SHOW=false

# Spaceship Prompt
autoload -U promptinit; promptinit
prompt spaceship

