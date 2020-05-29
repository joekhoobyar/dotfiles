#!/bin/sh
#
# setup
#
# This sets up dotfiles
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

DOTFILES_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

# Making directories for initialization files.
printf "\n> dotfiles dirs\n"
(cd "$DOTFILES_REPO" &&
    find files -mindepth 1 -type d | sed -e s@^files/@@g | while read subdir
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
            echo ln -nsf "$DOTFILES_REPO"/files/"$item" ~/"$item"
            ln -nsf "$DOTFILES_REPO"/files/"$item" ~/"$item"
        fi
    done)

if [ "$OS" == "mac" ]; then
    printf "\n> homebrew\n"
    homebrew/install.sh
    homebrew/update.sh || true
else
    printf "\n> homebrew [SKIP]\n"
fi

printf "\n> helm\n"
helm/update.sh

printf "\n> ruby\n"
ruby/update.sh

printf "\n> go\n"
go/update.sh

exit 0
