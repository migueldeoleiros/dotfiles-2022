#!/usr/bin/env bash
#
#migueldeoleiros: September 2020
#
#This is a simple script to change the Wallpaper on my i3 config through a rofi menu
#It requires to restart i3 to see the changes
#
set -euo pipefail

NewWallName=$(ls ~/Wallpapers | rofi -dmenu -i -p)
NewWall='~/Wallpapers/'$NewWallName''
OldWall=$(grep 'feh' ~/.config/i3/config | awk '{print $4}')
sed -i 's#'$OldWall'#'$NewWall'#g' ~/.config/i3/config
