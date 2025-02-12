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

[ -r ~/Brewfile.local ] || touch ~/Brewfile.local

printf "\n> brew bundle\n"
(cd "$DOTFILES_REPO" &&
    if [ -f "Brewfile.lock.json.$OS" ]; then
        cp "Brewfile.lock.json.$OS" "Brewfile.lock.json"
    fi &&
    cat Brewfile.$OS ~/Brewfile.local >Brewfile &&
    brew bundle ;
    ec=$? ;
    cp "Brewfile.lock.json" "Brewfile.lock.json.$OS"
    exit $? )

printf "> brew upgrade\n"
brew upgrade

printf "\n> brew bundle cleanup\n"
(cd "$DOTFILES_REPO" &&
    brew bundle cleanup --force)

exit 0
