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

# Configure KBFS on UNIX
if [ "$OS" == "unix" ]; then

    echo "  Configuring KBFS for you."
    keybase config set mountdir ~/keybase
fi

exit 0
