[ -r "$HOME/.localrc" ] && source "$HOME/.localrc"
if [ -x /usr/local/bin/brew ]
then eval "$(/usr/local/bin/brew shellenv)"
else eval "$(/opt/homebrew/bin/brew shellenv)"
fi
