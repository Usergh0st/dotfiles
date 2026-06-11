#!/usr/bin/env bash
# =========================================================
# Author: Enríque González Aka (Usergh0st)
# Description: Simple script that sets a wallpaper.
# Repository: https://github.com/Usergh0st/Machinepwn
# Date: 10.06.2026 08:22 PM
# Licensed: under GPL-3 Licensed
# =========================================================

# Variable feth walls directory.
wallpapers_directory="${HOME}/.config/bspwm/walls"

# Search for a wallpaper in any format.
wallpapers=($(find "${wallpapers_directory}" -type f -name "*.png" -o -name "*.jpg" -o -name "*.jpeg"))

# Pick one at random.
random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

# Set wallpaper.
feh --bg-scale "${random_wallpaper}"
