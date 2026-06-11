#!/bin/sh
# =======================================================
# Author: Enríque González Aka (Usergh0st)
# Repository: https://github.com/Usergh0st/Machinepwn
# Date: 10.06.2026 08:06 PM
# Mail: tsohg.uncork054@passinbox.com
# Description: The external rules for bspwm
# Licensed under GPL-3.0 license
# =======================================================

wid=$1
class=$2
instance=$3
consequences=$4

result () {
	eval "${consequences}"
	[ "${state}" ] || echo "$1"
}

case "${class}" in
	pavucontrol)
		result "state=floating focus=on follow=on sticky=on rectangle=422x400+1490+33" ;;
	font-manager)
		result "state=floating focus=on center=on" ;;
	font-viewer)
		result "state=floating focus=on center=on" ;;
	Bleachbit)
		result "state=floating focus=on center=on" ;;
	stacer)
		result "state=floating focus=on center=on" ;;
	SimpleScreenRecorder)
		result "state=floating focus=on center=on" ;;
	mpv)
		result "state=floating focus=on center=on" ;;
	Thunar)
		result "state=floating focus=on center=on" ;;
	Virt-manager)
		result "state=floating focus=on center=on" ;;
	obsidian)
		result "state=floating focus=on center=on" ;;
	firefox-esr)
		result "focus=on follow=on" ;;
	Anki)
		result "state=floating focus=on center=on" ;;
	# Alacritty floating terminal when open's
	# Alacritty othrs function terminals
	FloaTerm)
		result "state=floating center=on rectangle=696x399+0+0" ;;
	Updating)
		result "state=floating sticky=on center=on rectangle=696x399+0+0" ;;
esac
