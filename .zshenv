set -U PATH path

# Other XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

#japanese
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

#QT themes
export QT_QPA_PLATFORMTHEME='qt5ct'
#export QT_STYLE_OVERRIDE=kvantum

# Disable files
export LESSHISTFILE=-

# Default Apps
export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="qutebrowser"
#export BROWSER="librewolf"
export VIDEO="mpv"
export IMAGE="feh"
export OPENER="xdg-open"
export PAGER="less"
export WM="i3-gaps"
 
#ytfzf
YTFZF_CONFIG_FILE=$YTFZF_CONFIG_DIR/conf.sh
YTFZF_CONFIG_DIR=$HOME/.config/ytfzf

#clean $HOME
export GOPATH=$XDG_CONFIG_HOME/go
export CARGO_HOME="$XDG_DATA_HOME"/cargo
# export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
# export OPAMROOT="$XDG_DATA_HOME/opam"
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export STACK_ROOT="$XDG_DATA_HOME"/stack
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export _Z_DATA="$XDG_DATA_HOME/z"


# Start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
# Start bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
# Start stand out
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
# End standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# Start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# End Underline
export LESS_TERMCAP_ue=$(tput sgr0)
# End bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)

