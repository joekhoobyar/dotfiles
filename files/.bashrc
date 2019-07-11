if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

set -o vi

source ~/.git-prompt.sh

#export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;36m\]$(__git_ps1 " (%s)") \[\033[01;34m\]\$\[\033[00m\] '
export PS1='\[\033[01;32m\]\h\[\033[01;34m\] \W\[\033[01;36m\]$(__git_ps1 " (%s)") \[\033[01;34m\]\$\[\033[00m\] '

#export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWSTASHSTATE=1

export PATH="$HOME/bin:$PATH"
export EDITOR=/usr/bin/vim
alias be='bundle exec'
alias ll='ls -l'
alias vi=vim

eval "$(direnv hook bash)"

for p in ~/.bash/*.sh; do
    [ -r "$p" ] && source "$p"
done
[ -r ~/.localrc ] && source ~/.localrc

alias kctx='kubects'
alias kns='kubens'
