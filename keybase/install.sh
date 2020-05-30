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

# Check for keybase
if test ! $(command -v keybase); then
    if [ "$OS" == "mac" ]; then
        echo "Please install keybase first!" >&2 ; exit 1
    fi

    TMP_DIR=`mktemp -d`
    trap "rm -rf $TMP_DIR" 0

    echo "  Installing Keybase for you."
    (cd "$TMP_DIR" &&
        wget https://prerelease.keybase.io/keybase_amd64.rpm &&
        rpm2targz keybase_amd64.rpm &&
        tar -C "$HOME" --strip-components=2 -xzvf keybase_amd64.tar.gz ./usr/bin | sed -e 's@^./usr@@g')
fi

# Login to keybase
keybase login joekhoobyar

exit 0
