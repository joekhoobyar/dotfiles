if [ -x /usr/local/bin/brew ]
then eval "$(/usr/local/bin/brew shellenv)"
else eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Add sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -r "$HOME/.localrc" ] && source "$HOME/.localrc"
