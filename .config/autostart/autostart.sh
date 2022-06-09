#!/usr/bin/env bash

#scripts
bash ~/.scripts/easyKey.sh
bash ~/.scripts/speed.sh
bash ~/.scripts/nvidiarun.sh

#wallpaper
feh --no-fehbg --bg-scale ~/wallpapers/cherry_wallpaper_desaturated.jpg

#compositor
picom --experimental-backend -bc

#screen
xrandr --output HDMI-2 --mode 1920x1080 --right-of eDP-1
xset -dpms s off

#keyboard
xsetroot -cursor_name left_ptr
kmonad ~/.config/kmonad/laptop_config.kbd
kmonad ~/.config/kmonad/nt75_config.kbd
sxhkd

#dwm bar
bash ~/.scripts/dwmBar.sh &
