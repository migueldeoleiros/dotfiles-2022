#! /bin/bash

# migueldeoleiros 11/3/2021
#Script that displays a menu on tty login
#dependencies: smenu, figlet, lolcat, neofetch and whatever you want to start on


if [[ "$(tty)" == "/dev/tty1" || "$(tty)" == "/dev/tty2" || "$(tty)" == "/dev/tty3" || "$(tty)" == "/dev/tty4" ]]; then

    figlet welcome MASTER | lolcat

    selection=$(cat /home/miguel/.scripts/startMenu/menuList| smenu -c -W $'\n' -N )

    if [[ "$(echo $selection)" == "Start xserver for i3" ]]; then
        startx i3
    elif [[ "$(echo $selection)" == "Start xserver with NVidia drivers and i3" ]]; then
        nvidia-xrun i3
    elif [[ "$(echo $selection)" == "Start Sway" ]]; then
        sway
    elif [[ "$(echo $selection)" == "Start xserver for awesome" ]]; then
        startx awesome
    elif [[ "$(echo $selection)" == "Continue on the TTY" ]]; then
        tmux -2 new-session "neofetch ; zsh"
    fi

fi
