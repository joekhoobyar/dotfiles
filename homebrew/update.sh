#!/bin/sh
#
# Homebrew
#
# This updates homebrew plus dependencies.
set -e

DOTFILES_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd -P)"

printf "\n> brew update\n"
brew update
brew upgrade

printf "\n> brew bundle cleanup\n"
[ -r ~/Brewfile.local ] || touch ~/Brewfile.local
(cd "$DOTFILES_REPO" &&
    cat Brewfile.common ~/Brewfile.local >Brewfile &&
    brew bundle cleanup --force)

printf "\n> brew bundle\n"
(cd "$DOTFILES_REPO" &&
    brew bundle)

exit 0
