#!/bin/sh
#
# setup
#
# This sets up dotfiles
set -e

ARCH=$(uname -m)
case $ARCH in
x86)
    ;;
x86_64)
    ARCH=amd64
    ;;
armv[8-9]*|armv1[0-9]*)
    ARCH=arm64
    ;;
arm*)
    ARCH=arm32
    ;;
esac
export ARCH

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
export OS

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

# Installing homebrew
if [ "$OS" == "mac" ] || [ "$ARCH" == "amd64" ] || [ "$ARCH" == "x86" ]; then
    printf "\n> homebrew\n"
    homebrew/install.sh
    command -v brew >/dev/null || eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    export PATH
    homebrew/update.sh || true
fi

if [ "$OS" == "mac" ] || [ "$ARCH" == "amd64" ] || [ "$ARCH" == "x86" ]; then
    printf "\n> keybase\n"
    keybase/install.sh
fi

printf "\n> helm\n"
helm/update.sh

printf "\n> ruby\n"
ruby/update.sh

printf "\n> go\n"
go/update.sh

exit 0
