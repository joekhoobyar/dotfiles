if [ -d /opt/homebrew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH="/opt/homebrew/bin:$PATH"
elif [ -d /home/linuxbrew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

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

# Other initialization
export EDITOR=/usr/bin/vim
export ANSIBLE_INVENTORY='inventory,ansible/inventory,/usr/local/etc/ansible/hosts'
#export ANSIBLE_INVENTORY_PLUGINS='plugins/inventory,~/.ansible/plugins/inventory,/usr/share/ansible/plugins/inventory'
alias be='bundle exec'
if command -v gls >/dev/null; then
    alias ls='gls --color=auto'
    alias ll='gls --color=auto -l'
else
    alias ls='ls --color=auto'
    alias ll='ls --color=auto -l'
fi
alias vi=vim

eval "$(direnv hook bash)"

for p in ~/.bash/*.sh; do
    [ -r "$p" ] && source "$p"
done
[ -r ~/.localrc ] && source ~/.localrc

export PATH="$HOME/bin:$PATH"

alias rk='bundle exec rake'
alias g='git'

# Preferring OpenSSL
export PATH="/usr/local/opt/openssl/bin:$PATH"

# Using GPG in commits
export GPG_TTY=$(tty)
