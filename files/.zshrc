# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Get homebrew paths
if command -v brew 2>&1 >/dev/null
then export MY_HOMEBREW_DIR=$(brew --prefix)
elif command -v /opt/homebrew/bin/brew 2>&1 >/dev/null
then export MY_HOMEBREW_DIR=$(/opt/homebrew/bin/brew --prefix)
fi
[ -n "$MY_HOMEBREW_DIR" ] && eval "$($MY_HOMEBREW_DIR/bin/brew shellenv)"

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

set -o vi

# Other initialization
export EDITOR=/usr/bin/vim
export ANSIBLE_INVENTORY='inventory,ansible/inventory,/opt/etc/ansible/hosts'
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
[ -r "$HOME/.localrc" ] && source "$HOME/.localrc"

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
[[ ! -r ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable vi mode
[ -n "$MY_HOMEBREW_DIR" ] && source "$MY_HOMEBREW_DIR/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
export PATH="/opt/homebrew/opt/mongodb-community@4.4/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/joe.khoobyar/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/joe/.sdkman"
[[ -s "/Users/joe/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/joe/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi
