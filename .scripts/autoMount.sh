#!/usr/bin/bash

#migueldeoleiros: Sep 2021

#simple script to mount drives
#mount needs an exception to run as root user

selection=$(lsblk -nrpo "name,type,size,mountpoint"| awk '/part/ && $4!~/\// {print $1,$3}' | rofi -dmenu -p "choose a partition to mount")

partition=$(echo $selection | awk '{print $1}')

name=$(echo $partition | awk -F "/" ' {print $3}')

mkdir $HOME/mnt/$name

sudo mount $partition $HOME/mnt/$name
