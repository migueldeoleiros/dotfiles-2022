#!/bin/bash

#migueldeoleiros: August 2021

#converts webm files to m4a, ffmpeg is needed

dir=$(pwd)
files=($dir/*)
for index in ${!files[@]} 
do
    ffmpeg -i "${files[$index]}" -vn "${files[$index]}.m4a"
done
