#!/bin/sh
#
# Homebrew
#
# This updates homebrew plus dependencies.
set -e

OS=$(uname -s)
case $OS in
Darwin)
	OS=mac
	;;
Linux)
	OS=unix
	;;
*)
	echo "Unsupported OS: $OS" >&2 ; exit 1
	;;
esac

DOTFILES_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd -P)"

printf "\n> brew update\n"
brew update
printf "> brew upgrade\n"
brew upgrade
if [ "$OS" == "mac" ]; then
    printf "> brew cask upgrade\n"
    brew cask upgrade
else
    printf "> brew cask upgrade [SKIP]\n"
fi

[ -r ~/Brewfile.local ] || touch ~/Brewfile.local

printf "\n> brew bundle\n"
(cd "$DOTFILES_REPO" &&
    if [ -f "Brewfile.lock.json.$OS" ]; then
        cp "Brewfile.lock.json.$OS" "Brewfile.lock.json"
    fi &&
    cat Brewfile.$OS ~/Brewfile.local >Brewfile &&
    brew bundle &&
    cp "Brewfile.lock.json" "Brewfile.lock.json.$OS")

printf "\n> brew bundle cleanup\n"
(cd "$DOTFILES_REPO" &&
    brew bundle cleanup --force)

exit 0
