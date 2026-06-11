#!/bin/sh
# ================================================
# Author: Enríque González Aka (Usergh0st)
# Description: Control apps to launch.
# Repository: https://github/Usergh0st/Machinepwn
# Date: 10.06.2026 08:17 PM
# Licensed: under GPL-3 Licensed
# ================================================

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
