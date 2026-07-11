#!/bin/sh
# =============================================== #
# Author: Enríque González Aka (Usergh0st)        #
# Repository: https://github/Usergh0st/Machinepwn #
# Mail: tsohg.uncork054@passinbox.com             #
# Date: 11.07.2026 09:17 AM                       #
#                                                 #
# Script Name: OpenApps.sh                        #
# Description: Control apps to launch.            #
# Licensed: under GPL-3 Licensed                  #
# =============================================== #

case "${1}" in
	# Terminal alacritty launch modes
	# Choose your option dear user
	--terminal)
		Term.sh --terminal ;;
	--floating)
		Term.sh --floating ;;
	--update)
		Term.sh --update ;;
	--checkupdates)
		Term.sh --checkupdates ;;
	*)
		echo "Invalid Option" ;;
esac
