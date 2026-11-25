#!/usr/bin/env bash
# ░█▀█░█▀▀░█▀█░█░█░▀█▀░█▄█
# ░█░█░█▀▀░█░█░▀▄▀░░█░░█░█
# ░▀░▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀░▀

# ░▀█▀░█▀█░█▀▀░▀█▀░█▀█░█░░░█░░░█▀▀░█▀▄
# ░░█░░█░█░▀▀█░░█░░█▀█░█░░░█░░░█▀▀░█▀▄
# ░▀▀▀░▀░▀░▀▀▀░░▀░░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀

# Usergh0st - https://github.com/Usergh0st/dotfiles
# Date - 25.11.2026 11:11 A.M.
# Description - install my neovim configuration easily.
# Mail - tsohg.uncork054@passinbox.com
# Licensed under GPL-3.0 license

Blue="\e[1;34m"
Purple="\e[1;35m"
Cyan="\e[1;36m"
Reset="\e[0m"

function printf_banner () { 
    echo -e "${Cyan} ▐▒▒▒▒▒▒  ▐▒▒▒▒▒▒ ▐▒▒▒▒▒  ▐▒   ▐▒▒ ▐▒▒▒▒▒▒ ▐▒▒▒▒▒▒▒▒ ${Reset}   "
    echo -e "${Cyan} ▐▒▒ ▐▒▒▒ ▐▒      ▐▒  ▐▒▒ ▐▒▒  ▐▒▒   ▐▒    ▐▒▒ ▐▒ ▐▒▒${Reset}   "
    echo -e "${Cyan} ▐▒▒  ▐▒▒ ▐▒▒▒    ▐▒▒ ▐▒▒ ▐▒▒  ▐▒▒   ▐▒▒   ▐▒▒ ▐▒ ▐▒▒${Reset}   "
    echo -e "${Cyan} ▐▒▒  ▐▒▒ ▐▒▒     ▐▒▒ ▐▒▒ ▐▒▒  ▐▒▒   ▐▒▒   ▐▒▒    ▐▒▒${Reset}   "
    echo -e "${Cyan} ▐▒▒  ▐▒▒ ▐▒▒▒▒▒▒ ▐▒▒▒▒▒   ▐▒▒▒▒▀  ▐▒▒▒▒▒▒ ▐▒▒    ▐▒▒${Reset} \n"
}

function install_nvim_dependencies () {
    echo -e "${Blue}:: ${Reset}Checking the package manager... \n"

    if command -v apt &>/dev/null; then
        pkg="apt"
    elif command -v dnf &>/dev/null; then
        pkg="dnf"
    elif command -v pacman &>/dev/null; then
        pkg="pacman"
    else
        echo -e "${Blue}:: ${Reset}Package manager couldn't be deteted."
        exit 1
    fi

    # Packages in arch
    pacman_dpkg=(tree-sitter-cli tar curl bash-language-server lua-language-server zsh fd \ 
        make nodejs npm python3 lua)

    # Packages in debian
    apt_dpkg=(tree-sitter-cli fd-find ripgrep make curl tar git nodejs npm python3 lua5.4 \
        lua-language-server bash-language-server zsh)

    # Packages in fedora
    dnf_dpkg=(tree-sitter-cli fd ripgrep make curl tar git nodejs npm python3 lua \ 
        lua-language-server bash-language-server zsh)

    echo -e "${Blue}:: ${Reset}Installing necessary dependencies... \n"

    if [[ "${pkg}" == "pacman" ]]; then
        sudo ${pkg} -S --needed --noconfirm ${pacman_dpkg[@]}
    elif [[ "${pkg}" == "apt" ]]; then
        sudo ${pkg} install ${apt_dpkg[@]} -y --no-install-recommends
    elif [[ "${pkg}" == "dnf" ]]; then
        sudo ${pkg} install ${dnf_dpkg[@]}
    fi

    echo -e ""
    echo -e "${Blue}:: ${Reset}Everything's done, enjoy the neovim." ; sleep 3
    exit 1
}

# Main rutine
printf_banner
install_nvim_dependencies
