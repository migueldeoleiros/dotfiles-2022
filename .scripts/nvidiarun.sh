#! /bin/bash

#turn on secondary display while using nvidia card

pro='rendererNVIDIA'
var=$(glxinfo | awk '!seen[$5]++ {print $2 $4}' | grep $pro)

if [[ "$(echo $var)" == "$(echo $pro)" ]]
    then
    xrandr --output HDMI-1-2 --auto --right-of eDP-1-1
    #xrandr --output HDMI-1-2 --off
fi
