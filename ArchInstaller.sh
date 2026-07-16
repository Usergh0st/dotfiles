#!/usr/bin/env bash
# ====================================================================== #
#  _______             __         _____   __                             #
# |   _   |.----.----.|  |--.    |     |_|__|.-----.--.--.--.--.         #
# |       ||   _|  __||     |    |       |  ||     |  |  |_   _|         #
# |___|___||__| |____||__|__|    |_______|__||__|__|_____|__.__|         #
#  _______               __          __ __                               #
# |_     _|.-----.-----.|  |_.---.-.|  |  |.-----.----.                  #
#  _|   |_ |     |__ --||   _|  _  ||  |  ||  -__|   _|                  #
# |_______||__|__|_____||____|___._||__|__||_____|__|                    #
#                                                                        #
# Author: Enríque González Aka (Usergh0st)                               #
# Repository: https://github.com/Usergh0st/dotfiles                      #
# Mail: tsohg.uncork054@passinbox.com                                    #
# Date: 12.07.2026 09:14 AM                                              #
#                                                                        #
# Description: Arch linux installer script for my dotfiles the installer #
# only works in arch linux, no others, distros and this script required  #
# root user passworld.                                                   #
#                                                                        #
# Copyright (C) 2025-2026 Usergh0st <usergh0stmail@proton.me>            #
# Copyright (C) 2026-2027 Usergh0st <usergh0stmail@proton.me>            #
# Licensed under GPL-3.0 license                                         #
# ====================================================================== #

# Display and debug output errors
set -uo pipefail

# Restart the entire terminal on startup
reset

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
sudo_pip=""

# Utils variables | variables de utilidades
blackarch="https://blackarch.org/strap.sh"
url_repo="https://github.com/Usergh0st/dotfiles.git"
zsh_sudo="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/plugins/sudo/sudo.plugin.zsh"

# List of packages to install | lista de paquetes a instalar
pkgs_xorg=(xorg-xrandr xorg-server xorg-xinit xorg-xsetroot xorg-xinput)

pkgs_bspw=(rofi feh polybar neovim git fastfetch net-tools \
	eza bat python-pywal less fzf thunar firefox rustup xclip \
	papirus-icon-theme)

pkgs_anys=(base-devel brightnessctl xdotool xsettingsd zsh zsh-autosuggestions \
zsh-syntax-highlighting curl)

# Logo function | funcion del logo
logo () {
  export LC_ALL="${LC_ALL:-C.UTF-8}"
  export LANG="${LANG:-C.UTF-8}"

  printf '%b' "${Bold}${LightRed}"
  cat <<'LOGO'
           =         -       :  .    ::.
            @ :          @     .   =
          .  @@     *@%@@*@@#@@  ..
           * .  . @@:        . @@   @  =  #
            :@ @@@=.           .-@@:  @ @
   : . =  % :  +@.                @@ . @ .    :
    @   *  .  @@#                 ##@  .     @
     @    @-@ #@#   @@@     @@@   #@+@    @-
   @@@   @ +  @@#  @@@@@  .@@@@@  #@%@.. @  -   @.
    %@    #- @%+#  @@@@@   +@@@@  #@%@         #
  ==      =.:=@+@+      @@@      @@#%    :@%
    =+=:     @@@@@@@@-  .    :@@@@ *@@* @+    : =
   @    @  *@@ @@@@@@  . @ +: @@@ @@@@ @
     @   @@-@@@ @ @ @@@@ @ @@@@  @@@ @@@@ @@@   @
  @@     @@@@@@@  @@@   @@@@@  @@@@.@@ @@ -   %
      @ =@@@=@@#@   @@-@-:@=   @@=%@@--:@@@#=
       +@#@:  @@                     %@@@@@-
  @  @+@==-@@=  %  =  ===-..== = .% .-#:@@+@ ==
       @@@@%    #=================#    @@@@@=  : -
    : @@@ @@@ @ #-======   ======-#  +@  @@@@ @.
   @  @*@.      #-===============-*  @  : %@@   =
   - = +@@:#@@@ #----------=------* -@@@@@@@     :
             . @@@@@@@@@@@@@@@@@@@@@.
LOGO
  printf '%b\n' "${Reset}"
}

# Fetch or traps ctrl_c | function para traquear el ctrl_c y salir⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
trap ctrl_c INT

function ctrl_c () {
	echo ""
	echo -e "${Yellow}[!] ${LightRed}Ending the installer session. ${Reset} \n"
	exit 1
}

# It keeps the sudo session alive while the script runs
extend_sudo_section () {
	while true; do
		sudo -n true
		sleep 60
		kill -0 "$$" 2>/dev/null || exit
	done 2>/dev/null &
	sudo_pip=$!
}

# Cleanup upon exiting the script (normal or by error/ctrl+c)
trap cleanup_sudo EXIT

cleanup_sudo () {
	if [[ -n "${sudo_pip}" ]]; then
		kill "${sudo_pip}" 2>/dev/null
	fi
}

# Initial checks function | funncion de comprobaciones iniciales
initial_checks () {

	# Get root temporary permissions | obtener permisos temporales de root
	clear ; logo ; sudo -v ; extend_sudo_section

	# Check the script located in home directory user | verifica si el script se esta ejecutando en directorio home
	if [[ "${PWD}" != "${HOME}" ]]; then

		clear ; logo
		
		echo -e "${Bold}${LightRed}                  [OS: ${Cyan}${os_name}${LightRed}] ${Reset} \n"
		
		echo -e "${Blue}[*] ${White}That's script must be executed from home directory ${Reset}" ; sleep 00.5
		echo -e "${Yellow}[!] ${White}Please move the script installer to your home directory ${Reset}" ; sleep 00.5
		echo -e "${Blue}[*] ${White}And try to run it again dear user: ${LightRed}[${who_user}] ${Reset}" ; sleep 00.5
		echo -e "${Yellow}[!] ${White}Your current directory: ${LightRed}["${PWD}"] ${Reset} \n" ; sleep 00.5
		exit 1
	fi
	
	# Check linux distro avalible (Arch linux/manjaro) | comprobar distro de linux valido arch linux o manjaro
	if [[ -f /etc/os-release ]]; then
		. /etc/os-release
		if [[ "${ID}" != "arch" ]] && [[ "${ID}" != "manjaro" ]]; then
			
			clear ; logo
		
			echo -e "${Bold}${LightRed}                 [ OS: ${Cyan}${os_name}${LightRed} ] ${Reset} \n"

			echo -e "${Blue}[*] ${White}This installer is only for arch linux or manjaro based distros ${Reset}" ; sleep 00.5
			echo -e "${Yellow}[!] ${White}Now your current distro is not supported. ${Reset}" ; sleep 00.5
			echo -e "${Yellow}[!] ${White}Your current distro is: ${LightRed}["${os_name}"] ${Reset} \n" ; sleep 00.5
			exit 1
		fi
	fi
}

# Installer welcome function | funcion de bienvenida del instalador
welcome () {

	clear ; logo
	
	echo -e "${Bold}${LightRed}               [ Welcome: ${Cyan}${who_user}${LightRed} ] ${Reset} \n"
	
	echo -e "${Cyan}This script will install my dotfiles and this is what it will do: ${Reset} \n"

	echo -e "${Blue}[*] ${White}2 Repositories will be installed: ${Green}[blackarch, chaotic-aur]  ${Reset}" ; sleep 00.5
	echo -e "${Blue}[*] ${White}Download my desktop environment in: ${Green}[${HOME}/cloning/dotfiles] ${Reset}" ; sleep 00.5
	echo -e "${Blue}[*] ${White}Install required packages and necessary dependencies ${Reset}" ; sleep 00.5
	echo -e "${Blue}[*] ${White}Backup of possible existing configurations like: ${Green}[bspwm, polybar, etc...] ${Reset}" ; sleep 00.5
	echo -e "${Blue}[*] ${White}Install and setup my configuration from: ${Green}[dotfiles] ${Reset}" ; sleep 00.5
	echo -e "${Blue}[*] ${White}Enabling some service and change your shell to zsh shell ${Reset} \n" ; sleep 00.5

	echo -e "${Yellow}[!] ${LightRed}My desktop environment doesn't modify any of your system settings ${Reset}" ; sleep 00.5
	echo -e "${Yellow}[!] ${LightRed}This script does not have the potential to break your system ${Reset} \n" ; sleep 00.5
	
	echo -ne "${Cyan}Press ${Green}return${Cyan} to start the installation or ${LightRed}[ctrl+c]${Cyan} to exit${Reset} "
	read
}

# Install dependencies funcion | funcion de instalacion de dependencies
install_dependencies () {

	clear ; logo

	echo -e "${Bold}${LightRed}         [ Install necessary dependencies ]${Reset} \n"

	echo -e "${Blue}[*] ${White}Updating and installing required packages and dependencies ${Reset} \n" ; sleep 1

	sudo pacman -Syu --noconfirm
	echo ""
	sudo pacman -S --needed "${pkgs_xorg[@]}" "${pkgs_bspw[@]}" "${pkgs_anys[@]}" --noconfirm

	echo ""
	echo -e "${Green}[i] ${White}Once done the system was updated and the necessary dependencies were installed ${Reset} \n" ; sleep 3
}

# Install blackarch repository and aur/helper paru | Instalar el repositorio de blackarch y el aur/helper paru
install_blackarch_repo_and_paru () {
	
	clear ; logo

	echo -e "${Bold}${LightRed}      [ Install blackarch repository and paru ]${Reset} \n"

	echo -ne "${Cyan}[?] ${White}Do you want to install the blackarch repository? ${LightRed}[Y/n]${Reset} "
	read destiny

	case ${destiny} in
		y|Y)
			echo -e "${Blue}[*] ${White}Add blackarch repository please wait for the script ${Reset} \n" ; sleep 1

			if command -v curl &>/dev/null; then
				curl -O ${blackarch} &>/dev/null
			elif command -v wget &>/dev/null; then
				wget ${blackarch} &>/dev/null
			else
				echo -e "${Yellow}[!] ${LightRed}The binaries for downloading the file could not be found" ; sleep 2
			fi
			
			# Verify the checksum strap.sh
			if ! echo "00688950aaf5e5804d2abebb8d3d3ea1d28525ed  strap.sh" | sha1sum -c --status; then
				echo -e "${Yellow}[!] ${LightRed}Checksum failed aborting ${Reset}" ; sleep 2
				rm -rf strap.sh
				return 1
			fi

			chmod +x strap.sh

			sudo ./strap.sh

			echo ""

			sudo pacman -Syu

			rm -rf strap.sh
	esac
}

# Main rutine | rutina principal
initial_checks
welcome

install_dependencies
install_blackarch_repo_and_paru
