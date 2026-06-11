#!/bin/sh
# ==============================================================
# Author: Enríque González Aka (Usergh0st)
# Repository: https://github.com/Usergh0st/Machinepwn
# Mail: tsohg.uncork054@passinbox.com
# Date: 10.06.2026 08:09 PM
#
# Description: Script to check for new updates in kali linux
# and sync updates module in polybar and others.
#
# Features:
#       ✔ Shows available updates
#       ✔ Update clock
#
# Copyright (C) 2025-2026 Usergh0st <usergh0stmail@proton.me>
# Copyright (C) 2026-2027 Usergh0st <usergh0stmail@proton.me>
# Licensed under GPL-3.0 license
# =============================================================

# Colors in the script
Red="\e[1;31m"
Yellow="\e[1;33m"
White="\e[107m"

# Fech update file
update_file="/var/cache/machinepwn/updates.txt"

# Check updates function
check_updates () {
	# Update repository and fetch avalible updates
	
	reset ; apt update -qq &>/dev/null

	available_updates=0
	if list_updates=$(apt list --upgradable 2>/dev/null); then
		available_updates=$(echo "${list_updates}" | grep -c "/")
	fi

# Write the total to file
echo "${available_updates}" > "${update_file}"
}

# Print update function
print_updates () {
	check_updates

	if [ "${available_updates}" -gt 0 ]; then
		printf "%bThere are %d updates available:%b\n\n" \
			"${Yellow}" "${available_updates}" "${Red}"

		if [ -n "${available_updates}" ]; then
			printf "%bOfficial updates:%b\n" "${Yellow}" "${White}"
			printf "%s\n" "${list_updates}" | \
			sed 's/->/\x1b[32;1m\x1b[0m/g'
		fi
	else
		printf "%b¡Your system is already updated!%b\n" "${Yellow}" "${Red}"
	fi
}

# Choose a option
case ${1} in
	--sync-polybar)
		check_updates ;;
	--print-updates)
		print_updates ;;
	*)
		echo " --sync-polybar"
		echo " --print-updates"
		exit 1
		;;
esac
