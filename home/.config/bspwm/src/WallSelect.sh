#!/usr/bin/env bash
# =================================================== #
# Author: Enríque González Aka (Usergh0st)            #
# Repository: https://github.com/Usergh0st/Machinepwn #
# Mail: tsohg.uncork054@passinbox.com                 #
# Date: 11.07.2026 09:31 AM                           #
#                                                     #
# Script Name: WallSelect.sh                          #
# Description: Simple script that sets a wallpaper.   #
# Licensed: under GPL-3 Licensed                      #
# =================================================== #

# Variable feth walls directory.
wallpapers_directory="${HOME}/.config/bspwm/walls"

# Search for a wallpaper in any format.
wallpapers=($(find "${wallpapers_directory}" -type f -name "*.png" -o -name "*.jpg" -o -name "*.jpeg"))

# Pick one at random.
random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

# Set wallpaper.
feh --bg-scale "${random_wallpaper}"
