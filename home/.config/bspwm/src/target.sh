#!/usr/bin/env bash
# ======================================================================= #
# Author: Enríque González Aka (Usergh0st)                                #
# Repository: https://github.com/Usergh0st/dotfiles                       #
# Mail: tsohg.uncork054@passinbox.com                                     #
# Date: 27.11.2026 09:30 A.M.                                             #
#                                                                         #
# Script Name: target.sh                                                  #
# Description: Small script that pinpoints the machine that was attacked. #
# Licensed: under GPL-3 Licensed                                          #
# ======================================================================= #

FILE="/tmp/target"
CMD=$(command -v bat || command -v batcat)

if [ $# -eq 0 ]; then
	if [ -e "${FILE}" ]; then
		${CMD} ${FILE}
	else
		printf "󰆨"
	fi

elif [ "$1" = "reset" ]; then
	rm -rf ${FILE}
else
	echo "$1" > ${FILE}
fi
