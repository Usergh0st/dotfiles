#!/usr/bin/env bash
# ==========================================================================================
# Author: Enríque González Aka (Usergh0st)
# Repository: https://github.com/Usergh0st/Machinepwn
# Mail: tsohg.uncork054@passinbox.com
# Date: 10.06.2026 07:59 PM
#
# Description: Configure your own monitor resolution, in case the first one doesn't work.
# Features:
#       ✔ Set a custom screen resolution
#
# Dependencies:
#   → xorg-xrandr
#   → x11-xserver-utils
#
# Copyright (C) 2025-2026 Usergh0st <usergh0stmail@proton.me>
# Copyright (C) 2026-2027 Usergh0st <usergh0stmail@proton.me>
# Licensed under GPL-3.0 license
# ==========================================================================================

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
