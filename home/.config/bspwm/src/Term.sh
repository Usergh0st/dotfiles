#!/bin/sh
# =================================================== #
# Author: Enríque González Aka (Usergh0st)            #
# Repository: https://github.com/Usergh0st/Machinepwn #
# Mail: tsohg.uncork054@passinbox.com                 #
# Date: 11.07.2026 09:27 AM                           #
#                                                     #
# Script Name: Term.sh                                #
# Description: The term launcher dynamic.             #
# Licensed: under GPL-3 Licensed                      #
# =================================================== #

# Check package managers
if command -v nala >/dev/null 2>&1; then
	package_manager="sudo nala full-upgrade"
elif command -v paru >/dev/null 2>&1; then
	package_manager="paru -Syu --nocombinedupgrade"
elif command -v pacman >/dev/null 2>&1; then
	package_manager="sudo pacman -Syu --noconfirm"
elif command -v apt >/dev/null 2>&1; then
	package_manager="sudo apt update -qq ; echo "" ; sudo apt full-upgrade"
else
	echo "No package manager detected"
	exit 1
fi

case ${1} in
	--terminal)
		alacritty & ;;
	--floating)
		alacritty --class FloaTerm,FloaTerm & ;;
	--update)
		alacritty --hold --class FloaTerm,FloaTerm -e zsh -c "${package_manager}" ;;
	--checkupdates)
		alacritty --hold --class Updating,Updating -e zsh -c "sudo ~/.config/bspwm/src/KaliUpdates.sh --print-updates" ;;
	*)
		echo "Please choose a correct option."

esac

