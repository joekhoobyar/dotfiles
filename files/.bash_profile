[ -r ~/.bashrc ] && . ~/.bashrc

[ -r /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

. ~/.bash-completion/git
. ~/.bash-completion/git-prompt

export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W\[\033[01;33m\]$(__git_ps1 " (%s)")\[\033[01;34m\] \$\[\033[00m\] '

alias ll='ls -lF'
alias la='ls -alF'

set -o vi
