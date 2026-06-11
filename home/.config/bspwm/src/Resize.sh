#!/usr/bin/env bash
# =========================================================
# Author: Enríque González Aka (Usergh0st)
# Description: A simple script to resize the windows.
# Repository: https://github.com/Usergh0st/Machinepwn
# Date: 10.06.2026 08:18 PM
# Licensed: under GPL-3 Licensed
# =========================================================

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
