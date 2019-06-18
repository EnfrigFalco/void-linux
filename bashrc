# .bashrc

# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi

if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi


#XDG - Base Directories
# LINK: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# LINK: https://wiki.archlinux.org/index.php/XDG_Base_Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
#export XDG_RUNTIME_DIR=""

# Functions
export EDITOR=nano




# Change directory without typing 'cd'
shopt -s autocd

# Alias System
alias cp="cp -iv"
alias mv="mv -iv"
alias grep="grep --colour=auto"
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lah'
alias l.='ls -d .* --color=auto --group-directories-first'
alias lsblk='lsblk -o +UUID,LABEL'
alias ..='cd ..'
alias h='history'
alias c='clear'
alias q='exit'
alias p='cat'
alias pd='pwd'
alias restart='sudo shutdown -r now'
alias shutdown='sudo shutdown -P now'

# Access Pi Server
alias pi='ssh -Y pi@192.168.0.99'

#Void Linux XBPS Package Manager
alias vpu='sudo xbps-install -Suv'	#package upgrade/update
alias vpi='sudo xbps-install -Sv'	#package install
alias vpr='sudo xbps-remove -Rv'	#package remove
alias vpq='sudo xbps-query -Rs'		#package query
alias vrq='sudo xbps-query -L'		#repositories query
alias vpc='sudo xbps-remove -Oov'	#cleanse dependancies and cache
alias vpe='sudo xbps-pkgdb -a'		#check for package errors

#Fedora DNF Package Manager
alias fpu='sudo dnf upgrade'		#package upgrade/update
alias fpi='sudo dnf install'		#package install
alias fpr='sudo dnf remove'		#package remove
alias fpq='sudo dnf search'		#package query
alias frq='sudo dnf repolist'		#repositories query
alias fpc='sudo xbps-remove -Oov'	#cleanse dependancies and cache
alias fpe='sudo xbps-pkgdb -a'		#check for package errors

# Debian APT Package Manager
alias dpu='sudo apt-get upgrade'	#package upgrade/update
alias dpi='sudo apt-get install'	#package install
alias dpr='sudo apt-get remove'		#package remove
alias dpq='sudo apt-get search'		#package query
alias drq='sudo apt-get repolist'	#repositories query
alias dpc='sudo apt-get'		#cleanse dependancies and cache
alias dpe='sudo apt-get'		#check for package errors
