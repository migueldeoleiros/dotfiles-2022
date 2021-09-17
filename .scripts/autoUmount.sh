#!/usr/bin/bash

#migueldeoleiros: Sep 2021

#simple script to dismount drives
#umount needs an exception to run as root

name=$(ls $HOME/mnt | dmenu -p "choose partition to dismount")

sudo umount /dev/$name

rmdir $HOME/mnt/$name

