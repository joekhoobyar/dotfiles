if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

set -o vi

# Git Bash Prompts
#export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;36m\]$(__git_ps1 " (%s)") \[\033[01;34m\]\$\[\033[00m\] '
export PS1='\[\033[01;32m\]\h\[\033[01;34m\] \W\[\033[01;36m\]$(__git_ps1 " (%s)") \[\033[01;34m\]\$\[\033[00m\] '
#export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWSTASHSTATE=1


# Path munging
pre_path=''
for d in /usr/local/lib/ruby/gems/2.5.0/bin /usr/local/opt/ruby/bin
do
    [ -d "$d" ] && pre_path="$d:"
done
export PATH="$HOME/bin:$pre_path$PATH"
unset pre_path

# Other initialization
export EDITOR=/usr/bin/vim
export ANSIBLE_INVENTORY='inventory,ansible/inventory,/usr/local/etc/ansible/hosts'
alias be='bundle exec'
alias ls='gls --color=auto'
alias ll='gls --color=auto -l'
alias vi=vim

eval "$(direnv hook bash)"

for p in ~/.bash/*.sh; do
    [ -r "$p" ] && source "$p"
done
[ -r ~/.localrc ] && source ~/.localrc

alias g='git'
alias k='kubectl'
alias kn='kubens'
eval "$(direnv hook bash)"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
