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
HISTSIZE=500
SAVEHIST=500
HISTFILE=~/.zsh_history
# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

#EMACS
export ALTERNATE_EDITOR=""

#run at start 
. ranger > /dev/null 2>&1
. ranger > /dev/null 2>&1
#pfetch | lolcat -h 0.8 

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

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL=">"
SPACESHIP_CHAR_SUFFIX=" "
#SPACESHIP_HG_SHOW=false
#SPACESHIP_PACKAGE_SHOW=false
#SPACESHIP_NODE_SHOW=false
#SPACESHIP_RUBY_SHOW=false
#SPACESHIP_ELM_SHOW=false
#SPACESHIP_ELIXIR_SHOW=false
#SPACESHIP_XCODE_SHOW_LOCAL=false
#SPACESHIP_SWIFT_SHOW_LOCAL=false
#SPACESHIP_GOLANG_SHOW=false
#SPACESHIP_PHP_SHOW=false
#SPACESHIP_RUST_SHOW=false
#SPACESHIP_JULIA_SHOW=false
#SPACESHIP_DOCKER_SHOW=false
#SPACESHIP_DOCKER_CONTEXT_SHOW=false
#SPACESHIP_AWS_SHOW=false
#SPACESHIP_CONDA_SHOW=false
#SPACESHIP_VENV_SHOW=false
##SPACESHIP_PYENV_SHOW=false
#SPACESHIP_DOTNET_SHOW=false
#SPACESHIP_EMBER_SHOW=false
#SPACESHIP_KUBECONTEXT_SHOW=false
#SPACESHIP_TERRAFORM_SHOW=false
#SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_BATTERY_SHOW=false
#SPACESHIP_JOBS_SHOW=false

# Spaceship Prompt
autoload -U promptinit; promptinit
prompt spaceship


eval $(thefuck --alias)

# opam configuration
[[ ! -r /home/miguel/.opam/opam-init/init.zsh ]] || source /home/miguel/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
