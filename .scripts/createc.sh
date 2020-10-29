#!/usr/bin/env bash
set -euo pipefail

#This is a simple sript that creates a project for C programing much like an IDE does

input=$(dmenu)
mkdir $input
cd $input

#create a blank c file on main.c
echo "#include <stdio.h>" >> main.c
echo " " >> main.c
echo "int main() {" >> main.c
echo " " >> main.c
echo " " >> main.c
echo " " >> main.c
echo "    return 0;" >> main.c
echo "}" >> main.c

#create the CMAkeLists file
echo "cmake_minimum_required(VERSION 3.17)" >> CMakeLists.txt
echo "project($input C)" >> CMakeLists.txt
echo " " >> CMakeLists.txt
echo "set(CMAKE_C_STANDART 99)" >> CMakeLists.txt
echo " " >> CMakeLists.txt
echo "add_executable($input main.c)" >> CMakeLists.txt

cmake .
