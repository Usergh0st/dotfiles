#!/bin/sh
# =================================================================================== #
# Author: Enríque González Aka (Usergh0st)                                            #
# Repository: https://github.com/Usergh0st/dotfiles                                   #
# Mail: tsohg.uncork054@passinbox.com                                                 #
# Date: 11.07.2026 09:00 PM                                                           #
#                                                                                     #
# Script Name: MonitorSetup.sh                                                        #
# Description: Dynamic multi-monitor support and configuration for bspwm using xrandr #
# Features:                                                                           #
#       ✔ Support multi-monitor                                                       #
#       ✔ Automatic resolution adjustment                                             #
#                                                                                     #
# Dependencies on Arch Linux:                                                         #
#   → xorg-xrandr, x11-xserver-utils                                                  #
#                                                                                     #
# Dependencies on Kali Linux:                                                         #
#   → xserver-xorg-core, x11-xserver-utils                                            #
#                                                                                     #
# Copyright (C) 2026-2027 Usergh0st <usergh0stmail@proton.me>                         #
# Licensed under GPL-3.0 license                                                      #
# =================================================================================== #

# Xrandr cmd to get connected monitors and their resolutions
ouput_xrandr=$(xrandr)

# Funtion to obtain monitor info
feth_monitor_info () {
    echo "${ouput_xrandr}" | awk -v monitor="$1" '
        $1 == monitor { getline; print $1, $2 }
    ' | tr -d '*+'
}

# Fetch connected monitors.
set -- $(echo -e "${ouput_xrandr}" | awk '$2 == "connected" {print $1}')
NUM_MONITORS=$#

# Configure monitors based on the number of connected monitors
case ${NUM_MONITORS} in
	1)
		monitor_1="$1"

		set -- $(feth_monitor_info "${monitor_1}")
		mode_1="$1"
		rate_1="$2"

		xrandr --output "${monitor_1}" --primary --mode "${mode_1}" --pos 0x0 --auto --rate "${rate_1}"
		bspc monitor "${monitor_1}" -d 1 2 3 4 5 6
		;;
	2)
		monitor_1="$1"
		monitor_2="$2"

		set -- $(feth_monitor_info "${monitor_1}")
		mode_1="$1"
		rate_1="$2"

		set -- $(feth_monitor_info "${monitor_2}")
		mode_2="$1"
		rate_2="$2"

		xrandr --output "${monitor_1}" --primary --mode "${mode_1}" --pos 0x0 --auto --rate "${rate_1}" \
		       --output "${monitor_2}" --mode "${mode_2}" --right-of "${monitor_1}" --auto --rate "${rate_2}"

		bspc monitor "${monitor_1}" -d 1 2 3 4
		bspc monitor "${monitor_2}" -d 5 6 7 8
		bspc wm -O "${monitor_1}" "${monitor_2}"
		;;
	*)
		echo "Only two monitors can be supported simultaneously"
esac
