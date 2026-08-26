#!/usr/bin/env bash
# ==================================================================== #
#  __  __         __ __      _____   __                                #
# |  |/  |.---.-.|  |__|    |     |_|__|.-----.--.--.--.--.            #
# |     < |  _  ||  |  |    |       |  ||     |  |  |_   _|            #
# |__|\__||___._||__|__|    |_______|__||__|__|_____|__.__|            #
#  _______               __          __ __                             #
# |_     _|.-----.-----.|  |_.---.-.|  |  |.-----.----.                #
#  _|   |_ |     |__ --||   _|  _  ||  |  ||  -__|   _|                #
# |_______||__|__|_____||____|___._||__|__||_____|__|                  #
#                                                                      #
# Author: Enríque González Aka (Usergh0st)                             #
# Repository: https://github.com/Usergh0st/dotfiles                    #
# Mail: tsohg.uncork054@passinbox.com                                  #
# Date: 12.07.2026 09:38 AM                                            #
#                                                                      #
# Description: Kali Linux installer script for my dotfiles the script  #
# only works in distributions based on debian and this script required #
# root user passaworld.                                                #
#                                                                      #
# Copyright (C) 2025-2026 Usergh0st <usergh0stmail@proton.me>          #
# Copyright (C) 2026-2027 Usergh0st <usergh0stmail@proton.me>          #
# Licensed under GPL-3.0 license                                       #
# ==================================================================== #

# Display and debug output errors
set -uo pipefail

# Restart the entire terminal on startup
reset

# Colors use this script | colores en el script
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
bspwm="https://github.com/baskerville/bspwm.git"
sxhkd="https://github.com/baskerville/sxhkd.git"
picom="https://github.com/yshui/picom.git"
repo_url="https://github.com/Usergh0st/dotfiles.git"
powerlevel10k="https://github.com/romkatv/powerlevel10k.git"
fzftabgit="https://github.com/Aloxaf/fzf-tab.git"
zsh_sudo="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/plugins/sudo/sudo.plugin.zsh"

# List of packages to install for bspwm | lista de paquetes para instalar en bspwm
dpkg_libs=(libxcb-xkb-dev libxkbcommon-dev librsvg2-common build-essential libxcb1-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-keysyms1-dev \
      libxcb-xinerama0-dev libxcb-shape0-dev libxcb-cursor-dev pkg-config libxcb-icccm4-dev libconfig-dev libdbus-1-dev libegl-dev libev-dev libepoxy-dev \
      libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev \
      libxcb-randr0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev)

dpkg_xorg=(xserver-xorg-core xserver-xorg-video-fbdev xserver-xorg-input-all x11-xserver-utils xinit xinput)

dpkg_pkgs=(polybar rofi alacritty zsh git wget curl net-tools xdotool pulseaudio-utils pulseaudio pavucontrol fzf psmisc \
fastfetch papirus-icon-theme adwaita-icon-theme bat firefox-esr openvpn bleachbit mousepad feh eza xclip zoxide)

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

# Fetch or traps ctrl_c | function para traquear el ctrl_c y salir.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
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

# Initial checks function | funcion de comprobaciones iniciales
initial_checks () {

	# Get root temporary permissions | obtener permisos temporales de root
	clear ; logo ; sudo -v ; extend_sudo_section

	# Check if the script is run from home directory | comprobar si el script se ejecuta desde el directorio home
	if [[ "${PWD}" != "${HOME}" ]]; then

		clear ; logo

		echo -e "${Bold}${LightRed}                 [ OS: ${Cyan}${os_name}${LightRed} ]${Reset} \n"

		echo -e "${Blue}[*] ${White}That's script must be executed from home directory ${Reset}" ; sleep 00.5
		echo -e "${Yellow}[!] ${White}Please move the script installer to your home directory ${Reset}" ; sleep 00.5
		echo -e "${Blue}[*] ${White}And try to run it again dear user: ${LightRed}[${who_user}] ${Reset}" ; sleep 00.5
		echo -e "${Yellow}[!] ${White}Current directory: ${LightRed}["${PWD}"] ${Reset} \n" ; sleep 00.5
		exit 1
	fi

	# Check linux distro avalible (kali linux/debian) | comprobar distro de linux valido kali o debian
	if [[ -f /etc/os-release ]]; then
		. /etc/os-release
		if [[ "${ID}" != "kali" ]] && [[ "${ID}" != "debian" ]]; then

			clear ; logo
		
			echo -e "${Bold}${LightRed}                 [ OS: ${Cyan}${os_name}${LightRed} ]${Reset} \n"

			echo -e "${Blue}[*] ${White}This installer is only for kali Linux or debian based distros ${Reset}" ; sleep 00.5
			echo -e "${Yellow}[!] ${White}Now your current distro is not supported. ${Reset}" ; sleep 00.5
			echo -e "${Yellow}[!] ${White}Your current distro is: ${LightRed}["${os_name}"] ${Reset} \n" ; sleep 00.5
			exit 1
		fi
	fi
}

# Installer welcome function | funcion de bienvenida del instalador
welcome () {

	clear ; logo
	
	echo -e "${Bold}${LightRed}                 [ Welcome: ${Cyan}${who_user}${LightRed} ]${Reset} \n"

	echo -e "${Cyan}This script will install my dotfiles and this is what it will do: ${Reset} \n"

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

# Install dependencies function | funcion de instalacion de dependencias
dotfiles_install_dependencies () {

	# Install required packages and dependencies | instalar paquetes y dependencias necesarias
	
	clear ; logo
	
	echo -e "${Bold}${LightRed}         [ Install necessary dependencies ]${Reset} \n"

	echo -e "${Blue}[*] ${White}Updating and installing required packages and dependencies ${Reset} \n" ; sleep 1

	sudo apt update ; sudo apt full-upgrade -y ; sudo apt install -y "${dpkg_libs[@]}" "${dpkg_xorg[@]}" "${dpkg_pkgs[@]}" --no-install-recommends

	echo ""
	echo -e "${Green}[i] ${White}Once done the system was updated and the necessary dependencies were installed ${Reset} \n" ; sleep 3
}

# Install bspwm, sxhkd and others function | funcion de instalacion de bspwm, sxhkd y otros
install_bspwm_sxhkd_and_others () {

	clear ; logo

	echo -e "${Bold}${LightRed}          [ Install bspwn, sxhkd, picom ]${Reset} \n"

	# Clone repositories | clonar repositorios
	echo -e "${Blue}[*] ${White}Cloning repositories in the current working folder ${Reset} \n" ; sleep 1

		# Checks folder exist or no | comprobar si la carpeta existe o no
		if [[ -d "${HOME}/cloning" ]]; then
			echo -e "${Yellow}[!] ${White}The folder ${LightRed}[cloning]${White} already exists in your home directory ${Reset} \n" ; sleep 1
			rm -rf "${HOME}/cloning"
		fi

	mkdir -p cloning ; cd "cloning" ; git clone --depth 1 --no-tags ${bspwm} &>/dev/null ; git clone --depth 1 --no-tags ${sxhkd} &>/dev/null ; git clone --depth 1 --no-tags ${picom} &>/dev/null ; git clone --depth 1 --no-tags ${repo_url} &>/dev/null

	sudo git clone --depth 1 --no-tags ${powerlevel10k} /usr/share/zsh-theme-powerlevel10k &>/dev/null ; sudo git clone --depth 1 --no-tags ${fzftabgit} /usr/share/fzf-tab-git &>/dev/null

	if command -v bspwm &>/dev/null; then
		echo -e "${Green}[i] ${White}The bspwm is already installed on your system ${Reset}" ; sleep 1
	else
		# Install bspwm with repository | instalar bspwm con el repositorio
		echo -e "${Blue}[*] ${White}Installing bspwm with the repository ${Reset}" ; sleep 00.5
		cd bspwm ; make &>/dev/null ; sudo make install &>/dev/null ; cd ..
		echo -e "${Green}[i] ${White}bspwm was installed ${Reset} \n" ; sleep 00.5
	fi

	if command -v sxhkd &>/dev/null; then
		echo -e "${Green}[i] ${White}The sxhkd is already installed on your system ${Reset}" ; sleep 1
	else
		# Install sxhkd with repository | instalar sxhkd con el repositorio
		echo -e "${Blue}[*] ${White}Installing sxhkd with the repository ${Reset}" ; sleep 00.5
		cd sxhkd ; make &>/dev/null ; sudo make install &>/dev/null ; cd ..
		echo -e "${Green}[i] ${White}sxhkd was installed ${Reset} \n" ; sleep 00.5
	fi

	if command -v picom &>/dev/null; then
		echo -e "${Green}[i] ${White}The picom compositor is already installed on your system ${Reset}" ; sleep 1
	else
		# Install picom with repository | instalar picom con el repositorio.
		echo -e "${Blue}[*] ${White}Installing picom with the repository ${Reset}" ; sleep 00.5
		cd picom ; meson setup --buildtype=release build  &>/dev/null ; ninja -C build &>/dev/null ; sudo ninja -C build install &>/dev/null ; cd ..
		echo -e "${Green}[i] ${White}picom was installed ${Reset} \n" ; sleep 00.5
	fi
}

# Backup old configurations function | funcion de backup de configuraciones antiguas
backup_old_configurations () {

	clear ; logo
	
	echo -e "${Bold}${LightRed}          [ Backups user configurations ]${Reset} \n"

	# Backup old configurations | hacer backup de las configuraciones antiguas
	cd "${HOME}" ; mkdir -p "backup" ; cd "backup"

	if [[ -d "${HOME}/.config/bspwm" ]]; then
		mv "${HOME}/.config/bspwm" "${HOME}/backup/bspwm.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}[i] ${White}bspwm folder configuration backed up ${Reset}" ; sleep 00.5
	else
		echo -e "${Blue}[*] ${White}No existing bspwm configuration found skipping backup ${Reset}" ; sleep 00.5
	fi

	if [[ -d "${HOME}/.config/sxhkd" ]]; then
		mv "${HOME}/.config/sxhkd" "${HOME}/backup/sxhkd.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}[i] ${White}sxhkd folder configuration backed up ${Reset}" ; sleep 00.5
	else
		echo -e "${Blue}[*] ${White}No existing sxhkd configuration found skipping backup ${Reset}" ; sleep 00.5
	fi

	if [[ -d "${HOME}/.config/polybar" ]]; then
		mv "${HOME}/.config/polybar" "${HOME}/backup/polybar.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}[i] ${White}polybar folder configuration backed up ${Reset}" ; sleep 00.5
	else
		echo -e "${Blue}[*] ${White}No existing polybar configuration found skipping backup ${Reset}" ; sleep 00.5
	fi

	if [[ -d "${HOME}/.config/alacritty" ]]; then
		mv "${HOME}/.config/alacritty" "${HOME}/backup/alacritty.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}[i] ${White}alacritty folder configuration backed up ${Reset}" ; sleep 00.5
	else
		echo -e "${Blue}[*] ${White}No existing alacritty configuration found skipping backup ${Reset}" ; sleep 1.1
	fi

	if [[ -d "${HOME}/.config/picom" ]]; then
		mv "${HOME}/.config/picom" "${HOME}/backup/picom.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}[i] ${White}picom folder configuration backed up ${Reset}" ; sleep 00.5
	else
		echo -e "${Blue}[*] ${White}No existing picom configuration found skipping backup ${Reset}" ; sleep 00.5
	fi

	if [[ -f "${HOME}/.zshrc" ]]; then
		mv "${HOME}/.zshrc" "${HOME}/backup/zshrc.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}[i] ${White}.zshrc file configuration backed up ${Reset} \n" ; sleep 00.5
	else
		echo -e "${Blue}[*] ${White}No existing .zshrc file configuration found skipping backup ${Reset} \n" ; sleep 00.5
	fi
}

# Change the default shell to zsh | cambiar la shell por defecto a zsh
dotfiles_change_default_shell () {

	clear ; logo
	
	echo -e "${Bold}${LightRed}           [ Change your shell to zsh ]${Reset} \n"

	who_user=$(whoami)
	zsh_path=$(command -v zsh)
	echo -e "${Blue}[*] ${White}Changing the shell to zsh for the user ${LightRed}(${who_user}) ${Reset}" ; sleep 00.5

    	if [[ -z "${zsh_path}" ]]; then
        	echo -e "${Yellow}[!] ${LightRed}The shell zsh is not installed cannot change shell ${Reset}" ; sleep 00.5
		return 1
    	fi

	if [[ "${SHELL}" != "${zsh_path}" ]]; then

        	echo -e "${Blue}[*] ${White}Changing your shell to zsh please wait ${Reset} \n" ; sleep 00.5

		if chsh -s "${zsh_path}"; then
			echo -e "${Green}[i] ${White}Okay it switched to zsh by default ${Reset}" ; sleep 00.5
		else
			echo -e "${Yellow}[!] ${LightRed}Errors occurred while switching the shell ${Reset}" ; sleep 00.5
		fi

	else
		echo -e "${Green}[i] ${White}Zsh is already your default shell ${Reset}" ; sleep 00.5
	fi
}

# Install dotfiles configuration files function | funcion de instalacion de archivos de configuracion de los dotfiles
install_dotfiles_configurations () {

	clear ; logo
	
	echo -e "${Bold}${LightRed}        [ Install dotfiles configurations ]${Reset} \n"

	# Copying directories also add permissions | copiando directorios y agregando permisos
	echo -e "${Blue}[*] ${White}Installing dotfiles configuration please wait ${Reset}" ; sleep 00.5
        cd "${HOME}/cloning/dotfiles/home/.config" || { echo "${LightRed}[!] ${White}Error the directory doesn't exist ${Reset}"; exit 1; }
        cp -r * "${HOME}/.config"

	# Adjusting the alacritty terminal according to the window manager | ajustando la terminal alacritty segun el gestor de ventanas
	rm -rf "${HOME}/.config/alacritty/hyprland" ; cd "${HOME}/.config/alacritty/bspwm" || { echo "${LightRed}[!] ${White}Error the directory doesn't exist ${Reset}"; exit 1; }
	mv * "${HOME}/.config/alacritty"
    rmdir "bspwm"

	# Add permissions files | agregando permisos a los archivos
	cd "${HOME}/.config/bspwm/" ; chmod +x bspwmrc ; chmod +x sxhkdrc
	cd "${HOME}/.config/bspwm/src" ; chmod +x *
	cd "${HOME}/.config/bspwm/polybar/barpwn" ; chmod +x launch.sh
	cd "${HOME}/.config/bspwm/polybar/homebar" ; chmod +x launch.sh
	
	# Copying zsh files and others | copiando archivos zsh y otras cosas
	cd "${HOME}/cloning/dotfiles/home/"
	cp .xinitrc .zprofile .zshrc .p10k.zsh "${HOME}"

	# Check if the destination folders exist | check if the destination folders exist
	if [[ -d "${HOME}/.local/share" ]]; then

		# Installing the fonts | instalar las fuentes
		cd "${HOME}/cloning/dotfiles/home/"
		cp -r fonts "${HOME}/.local/share/fonts" ; fc-cache -fv &>/dev/null
	else

		# Installing the fonts | instalar las fuentes
		mkdir -p "${HOME}/.local/share" ; cd "${HOME}/cloning/dotfiles/home/"
		cp -r fonts "${HOME}/.local/share/fonts" ; fc-cache -fv &>/dev/null
	fi

	# Installing others thins | instalar otras cosas
	folder="bin" ; mkdir -p "${HOME}/.local/${folder}"
	cd "${HOME}/cloning/dotfiles/misc" ; cp -r * "${HOME}/.local/${folder}"
	chmod +x "${HOME}/.local/${folder}"/*

	# Installing misc configuration | Instalar configuraciones del carpeta misc
	cd "${HOME}/.local/${folder}/confd"
	sudo mv "99local" "/etc/apt/apt.conf.d" ; sudo mv "local.conf" "/etc/fonts/"
	sudo mv "99-swappiness.conf" "/etc/sysctl.d/" ; sudo mv "30-touchpad.conf" "/etc/X11/xorg.conf.d/"

	# Temporary text for modules updates | texto temporal para el modulo updates
	sudo mkdir -p "/var/cache/dotfiles"
	echo '0' | sudo tee /var/cache/dotfiles/updates.txt &>/dev/null
	sudo chmod o+wr "/var/cache/dotfiles/updates.txt"

	# Installing zsh sudo plugin | instalar el plugin sudo zshrc
	sudo mkdir -p "/usr/share/zsh-sudo" ; cd "/usr/share/zsh-sudo"

	if command -v wget &>/dev/null; then
		sudo wget ${zsh_sudo} &>/dev/null
	elif command -v curl &>/dev/null; then
		sudo curl -LO ${zsh_sudo} &>/dev/null
	else
		echo -e "${Yellow}[!] ${LightRed}Error [curl, wget] binaries not found ${Reset}" ; sleep 2
		echo -e "${Blue}[*] ${White}The installation will complete but you will need to manually install the sudo plugin ${Reset}" ; sleep 1
		return 1
	fi

	echo -e "${Green}[i] ${White}dotfiles configuration installed correctly ${Reset} \n" ; sleep 3
}


# Configure and enable some services | confugurando y habilitando algunos servicios
dotfiles_configure_services () {

	clear ; logo
	
	echo -e "${Bold}${LightRed}            [ Configure some services ]${Reset} \n"

	echo -e "${Blue}[*] ${White}Configure and enable some services ${Reset}" ; sleep 00.5

	# Open directory services | Abriendo el directorio de servicios
	cd ${HOME}/.config/systemd/user

	# Enable user services update polybar hook | Habilitando el servicio que actualiza el hook en la polybar
	systemctl --user daemon-reload ; systemctl --user enable --now polybar-update.path &>/dev/null ; systemctl --user enable --now polybar-update.service &>/dev/null

	# Copying services kali update to /etc/systemd/system/ and enable | Copiando servicios de kali updates a /etc/systemd/system/
	sudo cp "KaliUpdates.service" "KaliUpdates.timer" "/etc/systemd/system/" ; cd "/etc/systemd/system/"
	sudo systemctl daemon-reexec ; sudo systemctl daemon-reload ; sudo systemctl enable --now KaliUpdates.timer &>/dev/null ; sudo systemctl enable --now KaliUpdates.service &>/dev/null
	
	# Copying the script in the working directory | Copiando el script en el directorio de trabajo
	cd "${HOME}/.config/bspwm/src" ; sudo cp "KaliUpdates.sh" "/usr/local/bin/" ; sudo chmod +x "/usr/local/bin/KaliUpdates.sh"

	echo -e "${Green}[i] ${White}Everything is ready services are enabled ${Reset} \n" ; sleep 00.5
}

# The final steps | ultimos pasos finales para la instalacion
dotfiles_final_steps () {

	clear ; logo
	
	echo -e "${Bold}${LightRed}                  [ Final steps ]${Reset} \n"

	echo -e "${Blue}[*] ${White}Deleting cloning folder and clean apt ${Reset}" ; sleep 00.5
	
	sudo apt update &>/dev/null
	sudo apt autoremove --purge -y &>/dev/null
	sudo apt autoclean -y &>/dev/null
	sudo rm -rf ${HOME}/cloning &>/dev/null

	echo -e "${Green}[i] ${White}Almost everything is ready please wait${Reset} \n" ; sleep 1
	echo -e "${Blue}[*] ${White}It is recommended to restart for the configuration to take effect${Reset}"
	echo -ne "${Cyan}[?] ${White}Do you want to restart the system? ${LightRed}[Y/n] ${Reset}"
	read destiny

	case ${destiny} in
		y|Y) echo -e "${Green}[i] ${White}Restarting the system please wait ${Reset}" ; sleep 2 ; sudo systemctl reboot ;;
		n|N) echo -e "${Yellow}[!] ${White}Aborting restart exiting the script goodbye ${Reset}" ; sleep 3 ; exit 0 ;;
		*) echo -e "${Yellow}[!] ${LightRed}Invalid option exiting ${Reset}" ; sleep 2 ; exit 1
	esac
}

# Main routine | rutina principal
initial_checks
welcome

dotfiles_install_dependencies
install_bspwm_sxhkd_and_others
backup_old_configurations
dotfiles_change_default_shell

install_dotfiles_configurations
dotfiles_configure_services
dotfiles_final_steps
