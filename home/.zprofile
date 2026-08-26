# Start the server xorg if it have bspwm.
# Start the server wayland if it have hyprland.

if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
	if command -v bspwm &>/dev/null; then
		exec startx
	elif command -v hyprland &>/dev/null; then
		exec start-hyprland
	else
		echo "Window manager can't be detected, please download bspwm or hyprland."
	fi
fi
