# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz promptinit; promptinit; prompt fade green
autoload -U colors; colors

if [ -d /opt/homebrew ]
then eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

set -o vi

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

eval "$(direnv hook zsh)"

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
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable vi mode
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
