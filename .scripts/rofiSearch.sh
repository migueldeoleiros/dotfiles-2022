#!/usr/bin/env bash

# Simple script to run Oi assistant on rofi
# find Oi in https://github.com/PureArtistry/oi/

search=$(rofi -dmenu -p "Search")
output=$(oi $search)
rofi -e "$output"
