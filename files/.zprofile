typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

#SSH_ENV="$HOME/.ssh/agent-environment"
#
#function start_agent {
#    echo "Initialising new SSH agent..."
#    /usr/bin/ssh-agent | sed 's/^echo/#echo/' >"$SSH_ENV"
#    echo succeeded
#    chmod 600 "$SSH_ENV"
#    . "$SSH_ENV" >/dev/null
#    /usr/bin/ssh-add
#}
#
## Source SSH settings, if applicable
#if [ -f "$SSH_ENV" ]; then
#    . "$SSH_ENV" >/dev/null
#    ps $SSH_AGENT_PID | grep ssh-agent$ >/dev/null || {
#        start_agent
#    }
#else
#    start_agent
#fi

k=/opt/homebrew/bin/brew ; [ -r "$k" ] && eval "$("$k" shellenv)"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

[ -r "$HOME/.localrc" ] && source "$HOME/.localrc"
