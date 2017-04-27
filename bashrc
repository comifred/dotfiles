# .bashrc

# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias ctags='ctags -R --sort=1 --fields=+iaS --exclude=.svn --exclude=linux --exclude=*.js --exclude=*.out'
alias getrfc='getrfc(){ wget http://www.rfc-editor.org/rfc/rfc$1.txt; }; getrfc'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific environment, aliases and functions
PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
export HISTCONTROL=ignoreboth
export HISTIGNORE='ls'
export EDITOR='/usr/bin/vim'

source ~/.git-completion.bash
