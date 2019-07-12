#!/bin/sh
#
# setup
#
# This sets up dotfiles
set -e

DOTFILES_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

# Making directories for initialization files.
printf "\n> dotfiles dirs\n"
(cd "$DOTFILES_REPO" &&
    find files -type d -mindepth 1 | sed -e s@^files/@@g | while read subdir
    do
            echo mkdir -p ~/"$subdir"
            mkdir -p ~/"$subdir"
    done)

# Symlinking initialization files.
printf "\n> dotfiles symlinks\n"
(cd "$DOTFILES_REPO" &&
    find files -type f | sed -e s@^files/@@g | while read item
    do
        if [ -r ~/"$item" ]
        then
            echo exists ~/"$item"
        else
            echo ln -nsf "$DOTFILES_REPO"/"$item" ~/"$item"
            ln -nsf "$DOTFILES_REPO"/"$item" ~/"$item"
        fi
    done)

printf "\n> homebrew\n"
homebrew/install.sh
homebrew/update.sh

printf "\n> ruby\n"
ruby/update.sh

exit 0
