#!/usr/bin/bash

#migueldeoleiros: Feb 2021

#simple script that launches dmenu for killing processes

program=$(ps -u $USER | awk '!seen[$4]++ {print $4}' | rofi -dmenu -p "kill")
killall $program
