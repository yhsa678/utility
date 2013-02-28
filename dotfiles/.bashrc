# base-files, tested on 4.2.24

# To pick up the latest recommended .bashrc content,
# look in /etc/defaults/etc/skel/.bashrc

# Setting system flag for customized commands
# Refs:
#    * http://en.wikipedia.org/wiki/Uname
if [[ `uname -s` == "Darwin" ]] ; then
	_mac=1
fi
if [[ `uname -s` == "Linux" ]] ; then
	_linux=1
fi

# Vi-mode: http://blog.sanctum.geek.nz/vi-mode-in-bash/ 
# set -o vi

# Interactive operation; Keep safe!
alias rm='rm -i'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias crontab='crontab -i'

# Some shortcuts for different directory listings
# classify files in colour
test $_linux && alias ls='ls -h --color=tty'
test $_mac && alias ls='ls -h -G'
# long list
alias ll='ls -l'
# avoid typo...
alias sl='ls'                                   

# Other shortcuts
alias file-grep='xargs grep -l'
alias grep='grep --color'                       # show differences in colour
alias tailf='tail -f'
alias ms='chmod u+x'
alias rl='readlink -f'
alias vless="$HOME/.vim/macros/less.sh"

# Git shortcuts
alias gita='git add'
alias gitc='git commit'
alias gits='git status'

# The console style
if [[ `whoami` == "root" ]] ; then
	# Make the prompt RED to warn me that I'm using Root
	# For more colors, please refer to:
	#     http://praxis.edoceo.com/howto/bash
	PS1='\[\e[31m\]\u@\h \[\e[33m\]${PWD/????????????????????????????*/...${PWD:${#PWD}-25}}\[\e[0m\]\n\$'
else
	PS1='\[\e[32m\]\u@\h \[\e[33m\]${PWD/????????????????????????????*/...${PWD:${#PWD}-25}}\[\e[0m\]\n\$'
fi

# Colorful man pages
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[01;36m'
export LESS_TERMCAP_md=$'\E[01;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;33m'

# My own path
export PATH="$PATH:$HOME/utils"
if [[ -e "$HOME/.pathrc" ]]; then
	. $HOME/.pathrc
fi
