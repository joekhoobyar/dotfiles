k=/opt/homebrew/bin/brew ; [ -r "$k" ] && eval "$("$k" shellenv)"

export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

[ -r "$HOME/.localrc" ] && source "$HOME/.localrc"
