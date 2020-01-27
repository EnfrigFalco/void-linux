# .bashrc

If running from tty1 start sway
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
# export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_CACHE_HOME="$HOME/.cache"


# Functions
#export PS1='$(whoami)@$(hostname):$(pwd)'
#export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '

PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]"
PS1="$PS1 \`if [ \$? = 0 ]; then echo -e '\[\033[01;32m\]:)';"
PS1="$PS1 else echo -e '\[\033[01;31m\]:(' \$?; fi\`\[\033[00m\] \$ "

 
export PS1
#export PS2='� '

export EDITOR=nvim


# Change directory without typing 'cd'
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
set completion-ignore-case="on"


# readline variables and bindings
#bind 'set keymap vi'
#bind 'set editing-mode vi'


bind 'set mark-directories on'
bind 'set mark-symlinked-directories on'
bind 'set page-completions off'
bind 'set visible-stats on'
bind 'set completion-query-items 9001'
bind 'set completion-ignore-case on'
bind 'set completion-prefix-display-length 2'
bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'
bind 'set completion-map-case on'

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
alias d='diff -y'
alias c='clear'
alias q='exit'
alias p='cat'
alias pd='pwd'
alias restart='sudo shutdown -r now'
alias reboot='sudo shutdown -r now'
alias shutdown='sudo shutdown -P now'
alias poweroff='sudo shutdown -P now'

# Access Pi Server
alias pi='ssh -Y pi@192.168.0.99'

# Youtube Dowloader
alias ytd="youtube-dl -f bestvideo+bestaudio "

#Void Linux XBPS Package Manager
alias vpu='sudo xbps-install -Suv'	#Upgrade Packages
alias vpi='sudo xbps-install -Sv'	#Install a package
alias vpr='sudo xbps-remove -Rv'	#Remove a package
alias vps='sudo xbps-query -Rs'		#Search for package
alias vpc='sudo xbps-remove -ov'	#cleanse dependancies and cache
alias vpe='sudo xbps-pkgdb -a'		#check for package errors
alias vqr='sudo xbps-query -L'		#repositories query

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

#starship - https://starship.rs/
#eval "$(starship init bash)"
