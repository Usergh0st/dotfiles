#!/usr/bin/env bash
# ================================================================
#  _______             __         _____   __
# |   _   |.----.----.|  |--.    |     |_|__|.-----.--.--.--.--.
# |       ||   _|  __||     |    |       |  ||     |  |  |_   _|
# |___|___||__| |____||__|__|    |_______|__||__|__|_____|__.__|
#  _______               __          __ __
# |_     _|.-----.-----.|  |_.---.-.|  |  |.-----.----.
#  _|   |_ |     |__ --||   _|  _  ||  |  ||  -__|   _|
# |_______||__|__|_____||____|___._||__|__||_____|__|

# Author: Enríque González Aka (Usergh0st)
# Repository: https://github.com/Usergh0st/Machinepwn
# Mail: usergh0stmail@proton.me
# Date: 13.06.2026 12:02 PM

# Description: Arch linux installer script for machinepwn desktop
# environment the installer only works in arch linux no others
# Distros and this script required root user passworld.

# Copyright (C) 2025-2026 Usergh0st <usergh0stmail@proton.me>
# Copyright (C) 2026-2027 Usergh0st <usergh0stmail@proton.me>
# Licensed under GPL-3.0 license
# ================================================================

# Colors use this script | colores que usa el script
Cyan="\e[1;36m"
White="\e[1;37m"
Blue="\e[1;34m"
Reset="\e[0m"
Green="\e[1;32m"
Yellow="\e[1;33m"
LightRed="\e[1;31m"
Bold="\e[1m"

# Another utils variables | otras variables utiles
who_user=$(whoami)
os_name=$(grep -oP '(?<=^NAME=")[^"]*' /etc/os-release)

# Utils variables | variables de utilidades
url_repo="https://github.com/Usergh0st/Machinepwn.git"
zsh_sudo="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/plugins/sudo/sudo.plugin.zsh"

# List of packages to install | lista de paquetes a instalar
pkgs_xorg="xorg-xrandr xorg-server xorg-xinit xorg-xsetroot xorg-xinput"

pkgs_bspw="bspwm sxhkd rofi feh polybar neovim git fastfetch net-tools \
	eza bat python-pywal less fzf thunar firefox picom rustup xclip \
	papirus-icon-theme"

pkgs_anys="base-devel brightnessctl xdotool xsettingsd zsh zsh-autosuggestions \
	zsh-syntax-highlighting"

# Logo function | funcion del logo
logo () {
  export LC_ALL="${LC_ALL:-C.UTF-8}"
  export LANG="${LANG:-C.UTF-8}"

  printf '%b' "${Bold}${LightRed}"
  cat <<'LOGO'
   ⠀⠀⠀⠀⠀⠀⠀⠄⠀⠰⡐⠀⠀⠀⠀⠀⠀⢀⣄⠀⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
   ⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⣿⡆⠀⠀⠀⠄⠀⠈⢀⣤⣤⣬⣥⣤⣀⡀⠀⠀⠀⠂⠀⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
   ⠀⠀⠀⠀⠀⠂⠀⠀⠑⠀⠀⠙⠃⠵⠀⢀⣴⣿⡿⠿⠿⠿⠿⠿⠿⢿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠀⠀⠀
   ⠀⠀⠀⠀⠀⠀⢰⣶⠀⠱⣆⠐⢦⡀⣠⣿⡟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣷⣆⡀⠸⠇⣀⠀⣐⢔⠈⠰⠰⠀⠀⠀⠀⠀
   ⠀⠀⠀⠀⠀⠀⠀⠁⠰⠀⡾⠷⣴⣿⡿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⡀⠀⠉⠀⠛⠂⢀⠀⠀⠀⠀⠀⠀⠀
   ⠀⠀⠀⣔⢄⠘⢄⡀⠉⠀⠀⢠⣾⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣷⡄⠀⠟⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀
   ⢀⠀⠀⠉⡈⠀⣀⠑⣤⢾⡆⢸⣿⣿⠀⠀⠀⣀⣀⣀⠀⠀⠀⠀⢀⣀⣀⡀⠀⠀⣿⣿⣧⠰⠃⡀⠀⣤⠒⠊⠁⠀⠀⠀⠀
   ⠀⠑⢤⣤⣄⠀⠉⠢⠀⠠⠓⢊⣿⣿⠀⠀⣾⣿⣿⣿⣷⠀⠀⢰⣿⣿⣿⣷⠀⠀⣿⣿⣿⠀⣀⠀⠤⠀⠀⠐⠀⠀⠠⠀⠀
   ⠀⠀⠈⡉⠯⠃⠸⠗⠠⣀⡻⢶⣽⣿⡀⠀⠻⣿⣿⣿⡟⠀⡀⠸⣿⣿⣿⡟⠀⢀⣿⣿⣿⠀⠙⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀
   ⠐⠤⠄⠀⠀⢀⠀⢄⡠⡍⠛⠻⣿⣿⣧⡀⠀⠉⠉⠉⠀⣾⣷⡄⠈⠉⠉⠀⣠⣾⣿⣿⡇⠀⠀⢈⣠⣶⠆⠀⠀⠀⠀⠂⠀
   ⠀⠀⠀⠔⣄⢤⡀⠈⠀⠀⣠⣾⣿⣿⡿⣿⣶⣶⠂⠀⠀⠁⠈⠁⠀⠐⣶⣾⣿⡿⣩⣿⣿⣦⡄⠸⠝⠀⠀⠀⠀⠆⢐⠀⠀
   ⠀⠈⠦⡀⠀⠀⠑⡄⢀⣼⣿⣿⣹⣿⣿⣷⣿⣿⣀⠸⡀⢠⡆⢠⡇⢀⣿⣿⠏⣴⣿⣿⢿⢋⣾⣄⠀⠀⠀⠀⠀⡀⠉⠀⠀
   ⠈⣀⡀⠈⠃⡀⠈⢹⣟⢯⡿⣿⣏⠻⣯⣿⣎⡻⢿⣶⣷⣼⣧⣼⣷⣿⠟⠁⣴⣿⣿⠋⣸⣾⣿⣿⣦⠒⠒⠊⠉⢀⠐⠁⠀
   ⠠⠛⠃⠠⠄⡀⡀⣾⣻⣿⣿⢟⣿⣦⡈⠙⡿⣿⣭⣍⣹⢿⣿⣿⡿⠁⠀⣾⣿⡟⣯⡾⣿⣯⡿⢛⣡⡇⠀⣠⠔⠁⠠⠀⠀
   ⠄⠀⡀⠀⠀⠃⣬⡛⣛⠛⠾⣯⣟⢾⡅⠀⠀⠙⢻⠎⢻⠆⠙⡏⠁⠀⠰⡿⠛⣵⡿⠛⠉⣉⣵⣾⣿⣿⡏⠁⠀⠀⢀⠀⠀
   ⢈⡆⠀⢴⣆⣠⣿⣿⡿⣷⣆⠈⠉⢡⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⡄⠀⠾⣟⣯⣿⣿⣿⡅⠀⢤⠀⡀⠀⠀
   ⠀⠑⢄⠀⠉⢸⣷⣖⣛⣋⠙⠿⠄⢸⠀⣷⣿⣷⣶⣿⣿⣶⣷⣷⣾⣿⣶⣷⣾⡆⡇⠀⠻⠟⣱⣿⣭⣾⣇⠍⠁⠀⠠⠀⠀
   ⢀⠀⠀⠶⠀⣿⣿⠿⣿⣿⣷⠦⠀⢸⠀⣿⣿⣿⣿⣿⡟⠉⠈⢿⣿⣿⣿⣿⣿⡇⡇⠀⢠⢾⠿⠶⣶⣿⣿⡄⢀⠀⠀⠀⠀
   ⠀⠀⠄⠀⠀⣿⣷⡏⠀⠀⠀⣰⡀⢻⠀⣿⣿⣿⣿⣿⣷⣄⣰⣿⣿⣿⣿⣿⣿⡇⡿⠀⣰⡀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀
   ⠀⠀⠀⠀⠀⠻⣿⣷⣀⣠⣴⣿⡿⢾⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡷⠾⣿⣿⣶⣶⣿⣿⡿⠃⠀⠀⠀⠀⠀
   ⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠹⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠗⠉⠉⠉⠉⠉⠉⠀  ⠀⠀
LOGO
  printf '%b\n' "${Reset}"
}

# Fetch or traps ctrl_c | function para traquear el ctrl_c y salir.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
trap ctrl_c INT
function ctrl_c () {
	echo ""
	echo -e "${Yellow}[!] ${LightRed}Ending the installer session! ${Reset} \n"
	exit 1
}

# Initial checks function | funncion de comprobaciones iniciales
Initial_checks () {

	# Check the script located in home directory user | verifica si el script se esta ejecutando en directorio home
	if [ "${PWD}" != "${HOME}" ]; then

		reser ; clear ; logo
		
		echo -e "${Bold}${LightRed}                 [OS: ${Cyan}${os_name}${LightRed}] ${Reset} \n"
		
		echo -e "${Blue}[*] ${White}That's script must be executed from home directory ${Reset}" ; sleep 00.5
		echo -e "${Yellow}[!] ${White}Please move the script installer to your home directory ${Reset}" ; sleep 00.5
		echo -e "${Blue}[*] ${White}And try to run it again dear user: ${LightRed}(${who_user}) ${Reset}" ; sleep 00.5
		echo -e "${Yellow}[!] ${White}Your current directory: ${LightRed}"${PWD}" ${Reset} \n" ; sleep 00.5
		exit 1
	fi
}

# Main rutine | rutina principal
Initial_checks
