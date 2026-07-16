#!/usr/bin/env bash
# ======================================================================== #
# Author: Enríque González Aka (Usergh0st)                                 #
# Repository: https://github.com/Usergh0st/dotfiles                        #
# Mail: tsohg.uncork054@passinbox.com                                      #
# Date: 11.07.2026 09:19 AM                                                #
#                                                                          #
# Script Name: powermenu.sh                                                #
# Description: A simple script powermenu, shutdown, restart and much more. #
# Licensed: under GPL-3 Licensed                                           #
# ======================================================================== #

# Enable strict mode.
set -euo pipefail

# Theme rofi path.
theme="${HOME}/.config/bspwm/rofi/powermenu.rasi"

# Prompt.
user="$(whoami)"

# Options.
power="󰤆"
restart="󰑐"
suspend="󰽥"
lock="󰕆"
logout="󰗽"

rofi_menu() {
  rofi -dmenu -i \
    -p "Goodbye ${user}" \
    -theme "${theme}"
}


# Show menu + capture choice.
choice="$(
  printf "%s\n%s\n%s\n%s\n%s\n" \
    "$lock" "$suspend" "$logout" "$restart" "$power" \
  | rofi_menu
)"


# Execute immediately.
case "${choice:-}" in
  "$lock")
    if command -v betterlockscreen >/dev/null 2>&1; then
      betterlockscreen -l
    elif command -v i3lock >/dev/null 2>&1; then
      i3lock -c 000000
    fi
    ;;
  "$suspend")
    systemctl suspend
    ;;
  "$logout")
    bspc quit
    ;;
  "$restart")
    systemctl reboot
    ;;
  "$power")
    systemctl poweroff
    ;;
  *)
    exit 0
    ;;
esac
