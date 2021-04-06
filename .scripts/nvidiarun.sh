#! /bin/bash

#turn off secondary display while using nvidia card

pro='tty2nvidia-xrun'
var=$(ps -u $USER | awk '!seen[$4]++ {print $2 $4}' | grep $pro)

if [[ "$(echo $var)" == "$(echo $pro)" ]]
    then
    xrandr --output HDMI-1-2 --auto --right-of eDP-1-1
    #xrandr --output HDMI-1-2 --off
fi
