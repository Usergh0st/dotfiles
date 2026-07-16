# ============================================================================== #
#                  __                                                            #
#    .-----.-----.|  |--.----.----.                                              #
#  __|-- __|__ --||     |   _|  __|                                              #
# |__|_____|_____||__|__|__| |____|                                              #
#                   __                                                           #
# .---.-.----.----.|  |--.                                                       #
# |  _  |   _|  __||     |                                                       #
# |___._|__| |____||__|__|                                                       #
#     __         __     __                                                       #
# .--|  |.-----.|  |--.|__|.---.-.-----.                                         #
# |  _  ||  -__||  _  ||  ||  _  |     |                                         #
# |_____||_____||_____||__||___._|__|__|                                         #
#                                                                                #
# Author: Enríque González Aka (Usergh0st)                                       #
# Repository: https://github.com/Usergh0st/dotfiles                              #
# Mail: tsohg.uncork054@passinbox.com                                            #
#                                                                                #
# Edit this file settings to adjust it your way user hack the world.             #
# Dependencies:                                                                  #
#             → eza, zsh, zsh-syntax-highlighting, zsh-autosuggestions aur/scrub #
#             → fzf, powerlevel10k, sudo_plugin, xclip                           #
#                                                                                #
# Date: 12.07.2026 09:47 AM                                                      #
# Tested: Kali/Arch                                                              #
# ============================================================================== #

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# .--.--.---.-.----.-----.
# |  |  |  _  |   _|__ --|
#  \___/|___._|__| |_____|
# Use software rendering, others thins and exports.

export LIBGL_ALWAYS_SOFTWARE=1
export VISUAL="${EDITOR}"
export EDITOR='nvim'
export BROWSER='firefox'
export SUDO_PROMPT="Requesting root access for the user %u 󰗋 ❱ "
export BAT_THEME="base16"

#         __ __
# .---.-.|  |__|.---.-.-----.-----.-----.
# |  _  ||  |  ||  _  |__ --|  -__|__ --|
# |___._||__|__||___._|_____|_____|_____|
# Specific command shortcuts for arch linux and kali/debian based distros.

# Adapting the bat or batcat command.
bat_cmd=$(command -v bat || command -v batcat)

if [[ -n "${bat_cmd}" ]]; then
  alias cat="${bat_cmd} --theme=base16"
  alias catn="${bat_cmd} --theme=base16 --style=plain"
  alias catnp="${bat_cmd} --theme=base16 --style=plain --paging=never"
else
  echo "The binary bat or batcat was not found."
fi

# Another custom aliases.
alias vi="nvim"
alias na="nano"
alias cls="clear"
alias clsram="sudo sync && sudo sysctl -w wm.drop_caches=3"
alias cacheft="fc-cache -fv"
alias arch-update="paru -Syu --nocombinedupgrade"
alias kali-update="sudo apt update ; clear ; apt list --upgradable ; sudo apt full-upgrade"
alias ping="ping -c 1 8.8.8.8 ; ping -c 1 google.es"
alias btw="fastfetch"
alias lock="ScreenLocker"
alias image="kitty +kitten icat"

# Clear system packages apt and pacman.
alias pacmancache="sudo pacman -Scc ; paru -Scc"
alias aptcache="sudo apt autoremove --purge"
alias dbpacman="sudo rm -rf /var/lib/pacman/db.lck ; sudo pacman -Syu"

# The ls colors with eza.
alias ls="eza --icons=always --color=always -a"
alias ll="eza --icons=always --color=always -la"

# Set target and clear the target.
alias settarget="target.sh"
alias cleartarget="target.sh reset"

#  __     __         __
# |  |--.|__|.-----.|  |_.-----.----.--.--.
# |     ||  ||__ --||   _|  _  |   _|  |  |
# |__|__||__||_____||____|_____|__| |___  |
#                                   |_____|
# History of commands used in zsh only 400.

export HISTORY_IGNORE="(sudo su|cat|ll|ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..|nvim|nano)"

HISTFILE=~/.config/zsh/zsh_history
HISTSIZE=400
SAVEHIST=400
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#                     __
# .-----.-----.-----.|__|.-----.-----.
# |  -__|     |  _  ||  ||     |  -__|
# |_____|__|__|___  ||__||__|__|_____|
#             |_____|
# Load some themes, settings, and other things.

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

#         __               __
# .-----.|  |.--.--.-----.|__|.-----.-----.
# |  _  ||  ||  |  |  _  ||  ||     |__ --|
# |   __||__||_____|___  ||__||__|__|_____|
# |__|             |_____|
# Plugins to use in the zsh. if not exist print errors msg.

# Check the zsh-syntax-highlighting.
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "Not found: zsh-syntax-highlighting"
fi

# Check the zsh-autosuggestions.
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
  echo "Not found: zsh-autosuggestions.zsh"
fi

# Check the sudo.plugin.zsh.
if [ -f /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh ]; then
  source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
elif [ -f /usr/share/zsh-sudo/sudo.plugin.zsh ]; then
  source /usr/share/zsh-sudo/sudo.plugin.zsh
else
  echo "Not found: sudo.plugin.zsh"
fi

# Check the fzf-tab.plugin.zsh
if [ -f /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh ]; then
  source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh
elif [ -f /usr/share/fzf-tab-git/fzf-tab.zsh ]; then
  source /usr/share/fzf-tab-git/fzf-tab.zsh
else
  echo "Not found: fzf-tab.zsh"
fi

#  _______                    __   __
# |    ___|.--.--.-----.----.|  |_|__|.-----.-----.-----.
# |    ___||  |  |     |  __||   _|  ||  _  |     |__ --|
# |___|    |_____|__|__|____||____|__||_____|__|__|_____|

# Function rmk using scrub and shred.
function rmk () {
	echo -e "                 __      "
	echo -e " .----.--------.|  |--.  "
	echo -e " |   _|        ||    <   "
	echo -e " |__| |__|__|__||__|__|\n"
	scrub -p dod $1
	shred -zun 7 -v $1
}

# Function mkt create working directorys.
function mkt () {
	echo -e "            __     __     "
	echo -e " .--------.|  |--.|  |_   "
	echo -e " |        ||    < |   _|  "
	echo -e " |__|__|__||__|__||____|\n"
	echo -e " Creating directories....\n"
	mkdir -p {nmap,content,exploits,scripts}
}

# Function get extract ports.
function extractports () {
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"

	echo -e "                    __         "
	echo -e " .-----.-----.----.|  |_.-----."
	echo -e " |  _  |  _  |   _||   _|__ --|"
	echo -e " |   __|_____|__|  |____|_____|"
	echo -e " |__|                          "

	echo -e "\nExtracting information...\n" > extractPorts.tmp
	echo -e "\tIP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\tOpen ports: $ports\n"  >> extractPorts.tmp

	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "Ports copied to clipboard\n"  >> extractPorts.tmp

	cat extractPorts.tmp; rm extractPorts.tmp
}

#               __                      __   __
# .-----.-----.|  |--.    .-----.-----.|  |_|__|.-----.-----.-----.
# |-- __|__ --||     |    |  _  |  _  ||   _|  ||  _  |     |__ --|
# |_____|_____||__|__|    |_____|   __||____|__||_____|__|__|_____|
#                               |__|
# zsh cool options.

setopt AUTOCD
setopt PROMPT_SUBST
setopt MENU_COMPLETE
setopt LIST_PACKED
setopt AUTO_LIST
setopt COMPLETE_IN_WORD

#  __   __
# |  |_|  |--.-----.--------.-----.
# |   _|     |  -__|        |  -__|
# |____|__|__|_____|__|__|__|_____|
# Theme uses my configuration zshrc.
# The theme is powerlevel10k.

# Check the powerlevel10k.
if [ -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]; then
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
else
  echo "Not found: powerlevel10k.zsh-theme"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#         __               __   __
# .-----.|  |_.---.-.----.|  |_|__|.-----.-----.
# |__ --||   _|  _  |   _||   _|  ||     |  _  |
# |_____||____|___._|__|  |____|__||__|__|___  |
#                                        |_____|
# Auto-start things
# disable-fzf-tab
