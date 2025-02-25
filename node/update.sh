#!/bin/bash -l
#
# node
#
# This updates node plus dependencies.
set -e

DOTFILES_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd -P)"

printf "\n> nvm update\n"
if ! source ~/.nvm/nvm.sh || ! command -v nvm >/dev/null 2>&1; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi

printf "\n> nvm install 22.x\n"
nvm install 22 --default

printf "\n> npm install yarn\n"
npm -g i yarn @linear/import

exit 0
