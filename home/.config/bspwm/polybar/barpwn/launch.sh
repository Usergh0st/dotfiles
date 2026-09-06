#!/usr/bin/env bash

# ░█░░░█▀█░█░█░█▀█░█▀▀░█░█
# ░█░░░█▀█░█░█░█░█░█░░░█▀█
# ░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░▀

# File to propouse launch the polybar.
# Terminate already running bar instances.
# If all your bars have ipc enabled you can use:

# polybar-msg cmd quit
# Otherwise you can use the nuclear option.
# Launch the polybar BarPwn.

for mon in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$mon polybar -q barpwn -c "${HOME}"/.config/bspwm/polybar/barpwn/config.ini &
done
echo "The polybar barpwn has been launched..."
