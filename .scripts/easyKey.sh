#!/usr/bin/env bash

#migueldeoleiros: January 2021

#This script remaps caps_lock to cntrl and short pressed caps_lock to esc
#It makes easier the use of emacs evil-mode

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps

# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'

# when both Shift buttons are pressed simultaneously, they turn Caps Lock on. it can be switched off by pressing Shift
setxkbmap -option 'shift:both_capslock_cancel' 

xmodmap ~/.Xmodmap
