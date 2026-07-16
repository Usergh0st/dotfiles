#!/bin/sh
# ======================================================================================= #
# Author: Enríque González Aka (Usergh0st)                                                #
# Repository: https://github.com/Usergh0st/dotfiles                                       #
# Mail: tsohg.uncork054@passinbox.com                                                     #
# Date: 11.07.2026 08:56 PM                                                               #
#                                                                                         #
# Script Name: CustomResolution.sh                                                        #
# Description: Configure your own monitor resolution, in case the first one doesn't work. #
# Features:                                                                               #
#       ✔ Set a custom screen resolution                                                  #
#                                                                                         #
# Dependencies on Arch Linux:                                                             #
#   → xorg-xrandr, x11-xserver-utils                                                      #
#                                                                                         #
# Dependencies on Kali Linux:                                                             #
#   → xserver-xorg-core, x11-xserver-utils                                                #
#                                                                                         #
# Copyright (C) 2026-2026 Usergh0st <usergh0stmail@proton.me>                             #
# Licensed under GPL-3.0 license                                                          #
# ======================================================================================= #

set -euo pipefail

# Hello dear user, edit these variables to your liking to apply the best resolution to your machine.
# This is in case you don't like the current resolution.
# Edit the (bspwmrc) file and change the script (CustomResolution.sh).
# (xrandr -q) to show screen resolutions.
mode="${1:-1920x1080}"
rate="${2:-60}"

# Detect the monitor.
primary_output="$(
  xrandr --query \
  | awk '$2=="connected" && $3=="primary" {print $1; exit}'
)"

# Fallback in case don't anything.
if [[ -z "${primary_output}" ]]; then
  primary_output="$(
    xrandr --query \
    | awk '$2=="connected" {print $1; exit}'
  )"
fi

if [[ -z "${primary_output}" ]]; then
  echo "No dectect monitor."
  exit 1
fi

# Apply
xrandr --output "${primary_output}" --primary --mode "${mode}" --rate "${rate}" --pos 0x0 --auto
bspc monitor "${primary_output}" -d 1 2 3 4 5 6
