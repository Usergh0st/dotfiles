#!/usr/bin/env bash
# ======================================================================= #
# Author: Enríque González Aka (Usergh0st)                                #
# Repository: https://github.com/Usergh0st/dotfiles                       #
# Mail: tsohg.uncork054@passinbox.com                                     #
# Date: 11.07.2026 09:25 AM                                               #
#                                                                         #
# Script Name: target.sh                                                  #
# Description: Small script that pinpoints the machine that was attacked. #
# Licensed: under GPL-3 Licensed                                          #
# ======================================================================= #

FILE=/tmp/target

if [ $# -eq 0 ]; then
	if [ -e "${FILE}" ]; then
		batcat ${FILE}
	else
		printf "󰆨"
	fi

elif [ "$1" = "reset" ]; then
	rm /tmp/target
else
	echo "$1" > ${FILE}
fi
