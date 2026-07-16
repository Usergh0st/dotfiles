#!/usr/bin/env bash
# ========================================================= #
# Author: Enríque González Aka (Usergh0st)                  #
# Repository: https://github.com/Usergh0st/dotfiles         #
# Mail: tsohg.uncork054@passinbox.com                       #
# Date: 11.07.2026 09:23 AM                                 #
#                                                           #
# Script Name: Resize.sh                                    #
# Description: A simple script to resize bspwm the windows. #
# Licensed: under GPL-3 Licensed                            #
# ========================================================= #

if bspc query -N -n focused.floating > /dev/null; then
	step=20
else
	step=100
fi

case "$1" in
	west) dir=right; falldir=left; x="-$step"; y=0;;
	east) dir=right; falldir=left; x="$step"; y=0;;
	north) dir=top; falldir=bottom; x=0; y="-$step";;
	south) dir=top; falldir=bottom; x=0; y="$step";;
esac

bspc node -z "$dir" "$x" "$y" || bspc node -z "$falldir" "$x" "$y"
