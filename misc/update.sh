#!/bin/sh
#
# misc
#
# This updates misc dependencies.
set -e

DOTFILES_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd -P)"

[ "$ARCH" == "x86" ] && ARCH=386

OS=$(uname -s)
case $OS in
Darwin)
	OS=darwin
	;;
Linux)
	OS=linux
	;;
*)
	echo "Unsupported OS: $OS" >&2 ; exit 1
	;;
esac

printf "\n> misc update\n"

printf "> misc - yaml2json\n"
if ! command -v ~/bin/yaml2json >/dev/null; then
    wget -O ~/bin/yaml2json https://github.com/bronze1man/yaml2json/releases/download/v1.3/"yaml2json_${OS}_${ARCH}"
    chmod -x ~/bin/yaml2json
fi

exit 0
