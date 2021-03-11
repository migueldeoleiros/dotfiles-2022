#!/usr/bin/env bash

#migueldeoleiros: Octover 2020

#This script remaps caps lock to esc
#It makes easier the use of vim modes

setxkbmap -option caps:escape
setxkbmap -option 'shift:both_capslock_cancel' # when both Shift buttons are pressed simultaneously, they turn Caps Lock on. it can be switched off by pressing Shift

