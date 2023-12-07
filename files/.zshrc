# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Get homebrew paths
if command -v brew 2>&1 >/dev/null
then export MY_HOMEBREW_DIR=$(brew --prefix)
elif command -v /opt/homebrew/bin/brew 2>&1 >/dev/null
then export MY_HOMEBREW_DIR=$(/opt/homebrew/bin/brew --prefix)
elif command -v /usr/local/bin/brew 2>&1 >/dev/null
then export MY_HOMEBREW_DIR=$(/usr/local/bin/brew --prefix)
fi
[ -n "$MY_HOMEBREW_DIR" ] && eval "$($MY_HOMEBREW_DIR/bin/brew shellenv)"

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
[ -n "$MY_HOMEBREW_DIR" ] && export PATH="$MY_HOMEBREW_DIR/opt/openssl/bin:$PATH"

# Using GPG in commits
export GPG_TTY=$(tty)
autoload -Uz promptinit; promptinit
autoload -U colors; colors

f="$MY_HOMEBREW_DIR/opt/powerlevel10k/powerlevel10k.zsh-theme"
if [ -r "$f" ]
then source "$f"
else
    f="$MY_HOMEBREW_DIR/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme"
    [ -r "$f" ] && source "$f"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable vi mode
[ -n "$MY_HOMEBREW_DIR" ] && source "$MY_HOMEBREW_DIR/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
export PATH="/opt/homebrew/opt/mongodb-community@4.4/bin:$PATH"
