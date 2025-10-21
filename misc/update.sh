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

if [ "$OS" == "darwin" ]; then
    tmutil addexclusion /Users/joe/Library/Containers/com.docker.docker/ || :
    tmutil addexclusion /Users/joe/Library/Containers/com.docker.helper/ || :
fi

printf "> misc - cmctl\n"
if ! command -v cmctl >/dev/null; then
    (
        xOS=$(go env GOOS)
        xARCH=$(go env GOARCH)
        curl -L -o cmctl.tar.gz https://github.com/jetstack/cert-manager/releases/latest/download/cmctl-$xOS-$xARCH.tar.gz
        tar xzf cmctl.tar.gz
        sudo mv cmctl /usr/local/bin
    )
fi

printf "> misc - vimrc\n"
if ! [ -d ~/.vim/bundle/vim-powershell ]; then
    (mkdir -p ~/.vim/bundle && cd ~/.vim/bundle && git clone https://github.com/zigford/vim-powershell.git)
fi

printf "> misc - hukum\n"
if ! command -v hukum >/dev/null; then
    npm install --global hukum
fi

printf "> misc - yaml2json\n"
if ! command -v ~/bin/yaml2json >/dev/null; then
    wget -O ~/bin/yaml2json https://github.com/bronze1man/yaml2json/releases/download/v1.3/"yaml2json_${OS}_${ARCH}"
    chmod +x ~/bin/yaml2json
fi

printf "> misc - doppler\n"
curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh | sudo sh

exit 0
