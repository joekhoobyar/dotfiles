#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.
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

# Check for Homebrew
if test ! $(which brew); then
    echo "  Installing Homebrew for you."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    if [ "$OS" == "unix" ]; then
        test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
        test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.localrc
    fi
fi

exit 0
