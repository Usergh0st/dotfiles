# ========================================================= #
# ░░░░▀▀█░█▀▀░█░█░█▀▄░█▀▀                                   #
# ░░░░▄▀░░▀▀█░█▀█░█▀▄░█░░                                   #
# ░▀░░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀                                   #
#                                                           #
# ░█▀█░█▀▄░█▀▀░█░█░░░░░░░░░█▀▄░█▀▀░█▀▄░▀█▀░█▀█░█▀█          #
# ░█▀█░█▀▄░█░░░█▀█░░░▄█▄░░░█░█░█▀▀░█▀▄░░█░░█▀█░█░█          #
# ░▀░▀░▀░▀░▀▀▀░▀░▀░░░░▀░░░░▀▀░░▀▀▀░▀▀░░▀▀▀░▀░▀░▀░▀          #
#                                                           #
# Author: Enríque González Aka (Usergh0st)                  #
# Repository: https://github.com/Usergh0st/dotfiles         #
# Mail: tsohg.uncork054@passinbox.com                       #
# Date: 27.08.2026 07:08 A.M.                               #
# zsh: 5.9.2                                                #
#                                                           #
# Description: Personal configuration of .zshrc file.       #
# Edit this file to adjust to your liking dear user.        #
#                                                           #
# Dependencies:                                             #
#            → zsh, eza, bat, zoxide, fzf, fzf-tab-git      #
#            → zsh-autosuggestions, zsh-syntax-highlighting #
#            → zsh-sudo.plugin, powerlevel10k.zsh-theme     #
#            → scrub, xclip                                 #
#                                                           #
# Tested: Kali/Arch                                         #
# ========================================================= #

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# ░█▀▀░█▀█░█░█
# ░█▀▀░█░█░▀▄▀
# ░▀▀▀░▀░▀░░▀░

# This part of the configuration handles environment variables.
# XDG, base directories, default code editor, path.

export XDG_LINUX_SYSTEM="$(grep -oP '(?<=^ID=).*' /etc/os-release | tr -d '"')"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_BIN_HOME="${HOME}/.local/bin"

export SUDO_PROMPT="Requesting root access for the user %u 󰗋 ❱ "
export FILEMANAGER='thunar'
export VISUAL="${EDITOR}"
export EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="alacritty"
export PAGER="less"
export LESS="-R --mouse"
export BAT_THEME="base16"
export GPG_TTY="${TTY}"

# ░█░█░▀█▀░█▀▀░▀█▀░█▀█░█▀▄░█░█
# ░█▀█░░█░░▀▀█░░█░░█░█░█▀▄░░█░
# ░▀░▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀░▀░░▀░

# This section is responsible for managing the history.
# of commands used within zsh, only 400 no more.

# If the folder zsh doesn't exist then create.
if [[ ! -d "${XDG_CONFIG_HOME}/zsh" ]]; then
	mkdir -p "${XDG_CONFIG_HOME}/zsh"
fi

# No enter in the history
zshaddhistory () {
    [[ $1 != (sudo su|cat|ls|ll|cd|pwd|exit|history|nvim|nano|sudo reboot)* ]]
}

HISTFILE=${XDG_CONFIG_HOME}/zsh/zsh_history
HISTSIZE=500
SAVEHIST=500
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ░▀▀█░█▀▀░█░█░░░█▀█░█▀█░▀█▀░▀█▀░█▀█░█▀█░█▀▀
# ░▄▀░░▀▀█░█▀█░░░█░█░█▀▀░░█░░░█░░█░█░█░█░▀▀█
# ░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀░░░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀

# This section activates some features of the shell.
# Enable command substitution and automatically list choices.

setopt AUTOCD
setopt PROMPT_SUBST
setopt MENU_COMPLETE
setopt LIST_PACKED
setopt AUTO_LIST
setopt COMPLETE_IN_WORD
setopt NUMERIC_GLOB_SORT

# ░█▀█░█░█░▀█▀░█▀█░█▀▀░▀█▀░█▀█░█▀▄░▀█▀
# ░█▀█░█░█░░█░░█░█░▀▀█░░█░░█▀█░█▀▄░░█░
# ░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░░▀░░▀░▀░▀░▀░░▀░

# This section auto start software that's common
# To use like fzf, zoxide, and the others.

# disable-fzf-tab
eval "$(zoxide init zsh)"

# ░█▀█░█░░░▀█▀░█▀█░█▀▀░█▀▀░█▀▀
# ░█▀█░█░░░░█░░█▀█░▀▀█░█▀▀░▀▀█
# ░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀

# This section is about shortcut commands or aliases.
# Now you're gonna see my personal aliases.

# Adapting the bat or batcat command.
bat_cmd=$(command -v bat || command -v batcat)

if [[ -n "${bat_cmd}" ]]; then
  alias cat="${bat_cmd} --theme=base16"
  alias catn="${bat_cmd} --theme=base16 --style=plain"
  alias catnp="${bat_cmd} --theme=base16 --style=plain --paging=never"
else
  echo "The binary bat or batcat couldn't be detected."
fi

# The really custom aliases.
alias v="nvim"
alias n="nano"

alias cls="clear"
alias clsram="sudo sync && sudo sysctl -w wm.drop_caches=3"
alias cacheft="fc-cache -fv"
alias arch-update="paru -Syu --nocombinedupgrade"
alias kali-update="sudo apt update ; clear ; apt list --upgradable ; sudo apt full-upgrade"
alias ping="ping -c 1 8.8.8.8 ; ping -c 1 google.es"
alias btw="fastfetch"

# Quick paru commands in arch linux one letter.
alias u="paru -Syu --nocombinedupgrade"
alias s="paru -Ss"
alias q="paru -Q"
alias r="paru -Rnscc"
alias i="paru -S"

# Clear system packages apt and pacman.
alias pacmancache="sudo pacman -Scc ; paru -Scc"
alias aptcache="sudo apt autoremove --purge"
alias dbpacman="sudo rm -rf /var/lib/pacman/db.lck ; sudo pacman -Syu"

# The ls and tree colors with eza.
alias ls="eza --icons=always --color=always -a"
alias ll="eza --icons=always --color=always -la"
alias tree="eza --icons=always --color=always --tree"

# The cd command with zoxide.
alias cd="z"

# Set target and clear the target.
alias settarget="target.sh"
alias cleartarget="target.sh reset"

# Deprecated custom aliases.
alias image="kitty +kitten icat"
alias lock="ScreenLocker"

# ░█▀▀░█▀█░█▄█░█▀█░█░░░█▀▀░▀█▀░▀█▀░█▀█░█▀█░█▀▀
# ░█░░░█░█░█░█░█▀▀░█░░░█▀▀░░█░░░█░░█░█░█░█░▀▀█
# ░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀

# This section is about auto command auto-completion.
# Using the letter TAB for navige to file or commands.

autoload -Uz compinit

if [ -d "${HOME}/.config/zsh" ]; then
    local zcompdump="${HOME}/.config/zsh/zcompdump"
else
    mkdir -p "${HOME}/.config/zsh"
    local zcompdump="${HOME}/.config/zsh/zcompdump"
fi

if [[ -n "$zcompdump"(#qN.mh+24) ]]; then
    compinit -i -d "$zcompdump"
else
    compinit -C -d "$zcompdump"
fi

if [[ ! -f "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc" ]]; then
    zcompile -U "$zcompdump"
fi

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }
_comp_options+=(globdots)

zstyle ':completion:*:git-checkout:*' sort true
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list \
		'm:{a-zA-Z}={A-Za-z}' \
		'+r:|[._-]=* r:|=*' \
		'+l:|=*'

zstyle ':vcs_info:*' formats ' %B%s-[%F{magenta}%f %F{yellow}%b%f]-'
zstyle ':fzf-tab:*' fzf-flags --style=full --height=95% --pointer '❱' \
                --color 'pointer:green:bold,bg+:-1:,fg+:green:bold,info:blue:bold,marker:yellow:bold,hl:gray:bold,hl+:yellow:bold' \
                --input-label ' 󰍉 ' --color 'input-border:blue,input-label:blue:bold' \
                --list-label ' 󰕆 ' --color 'list-border:green,list-label:green:bold' \
                --preview-label ' 󰛐 ' --color 'preview-border:magenta,preview-label:magenta:bold'

zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza -1 --icons=always --color=always -a ${realpath}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always -a ${realpath}'
zstyle ':fzf-tab:complete:*:*' fzf-preview '
if command -v bat &>/dev/null; then
  bat --color=always --theme=base16 --style=plain ${realpath}
elif command -v batcat &>/dev/null; then
  batcat --color=always --theme=base16 --style=plain ${realpath}
else
  cat ${realpath}
fi
'
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' accept-line enter

# ░█▀█░█░░░█░█░█▀▀░▀█▀░█▀█░█▀▀
# ░█▀▀░█░░░█░█░█░█░░█░░█░█░▀▀█
# ░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀

# This section is about plugins that can I use.
# zsh-sudo, completions and other things.

# Check if the plugins are installed: zsh-syntax-highlighting.zsh
if [[ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "The plugin zsh-syntax=highlighting couldn't be deteted."
fi

# Check if the plugins are installed: zsh-autosuggestions.zsh
if [[ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -f "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
  echo "The plugin zsh-autosuggestions couldn't be deteted."
fi

# Check if the plugins are installed: sudo.plugin.zsh
if [[ -f "/usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh" ]]; then
  source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
elif [[ -f "/usr/share/zsh-sudo/sudo.plugin.zsh" ]]; then
  source /usr/share/zsh-sudo/sudo.plugin.zsh
else
  echo "The plugin sudo.plugin.zsh couldn't be deteted."
fi

# Check if the plugins are installed: fzf-tab.plugin.zsh
if [[ -f "/usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh" ]]; then
  source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh
elif [[ -f "/usr/share/fzf-tab-git/fzf-tab.zsh" ]]; then
  source /usr/share/fzf-tab-git/fzf-tab.zsh
else
  echo "The plugin fzf-tab.plugin.zsh couldn't be deteted."
fi

# ░▀█▀░█░█░█▀▀░█▄█░█▀▀
# ░░█░░█▀█░█▀▀░█░█░█▀▀
# ░░▀░░▀░▀░▀▀▀░▀░▀░▀▀▀

# This section about the zsh theme that used this configuration.
# The powerlevel10k is the theme.

if [[ -f "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ]]; then
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
else
  echo "The plugin theme powerlevel10k.zsh-theme couldn't be deteted."
fi

# Enable powerlevel10k instant promt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ░█▀▀░█░█░█▀█░█▀▀░▀█▀░▀█▀░█▀█░█▀█░█▀▀
# ░█▀▀░█░█░█░█░█░░░░█░░░█░░█░█░█░█░▀▀█
# ░▀░░░▀▀▀░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀

# This section is about functions that my configuration
# Used, rmk, ExtractsPorts and the others.

function rmk () {
    if [[ $# -eq 0 ]]; then
        echo -e ""
        echo -e " \e[1;31m░█▀▄░█▄█░█░█         "
        echo -e " \e[1;31m░█▀▄░█░█░█▀▄         "
        echo -e " \e[1;31m░▀░▀░▀░▀░▀░▀ \e[3m \n"
        echo -e "Description: a way to delete files that are almost unrecoverable."
        echo -e "Usage: rmk file [file...]"
        return 1
    fi
    
    echo -e ""
    echo -e " \e[1;31m░█▀▄░█▄█░█░█         "
    echo -e " \e[1;31m░█▀▄░█░█░█▀▄         "
    echo -e " \e[1;31m░▀░▀░▀░▀░▀░▀ \e[3m \n"
    for file in "${@}"; do
        if [[ ! -e "${file}" ]]; then
            echo -e "File: [${file}] it doesn't exist."
            continue
        fi

        if [[ -d "${file}" ]]; then
            echo -e "File: [${file}] that's a directory."
            continue
        fi

        echo -e "File: [${file}] deleting"
        scrub -p dod "${file}"
        shred -zun 10 -v "${file}"
    done

    echo -e "shred: the process has been done."
}

function mkt () {
    echo -e ""
    echo -e " \e[1;31m░█▄█░█░█░▀█▀        "
    echo -e " \e[1;31m░█░█░█▀▄░░█░        "
    echo -e " \e[1;31m░▀░▀░▀░▀░░▀░\e[3m \n"
    local directorys=(nmap content exploits scripts)

    for dir in "${directorys[@]}"; do
        if [[ -d "${dir}" ]]; then
            echo -e "Directory: [${dir}] already exist."
        else
            mkdir -p "${dir}"
            echo -e "Directory: [${dir}] has been created."
        fi
    done
}

function extractports () {
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"

    echo -e ""
    echo -e "░█▀█░█▀█░█▀▄░▀█▀░█▀▀"
    echo -e "░█▀▀░█░█░█▀▄░░█░░▀▀█"
    echo -e "░▀░░░▀▀▀░▀░▀░░▀░░▀▀▀"

	echo -e "\nExtracting information...\n" > extractPorts.tmp
	echo -e "\tIP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\tOpen ports: $ports\n"  >> extractPorts.tmp

	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "Ports copied to clipboard\n"  >> extractPorts.tmp

	cat extractPorts.tmp; rm extractPorts.tmp
}
