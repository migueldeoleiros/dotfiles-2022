#!/usr/bin/env bash

#simple script to run Tuxi assistant on rofi/dmenu

search=$(rofi -dmenu -p "Tuxi")
output=$(tuxi -r $search)
rofi -e "$output"
