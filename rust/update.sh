#!/bin/sh
#
# rust
#
# This updates rust dependencies.
set -e

DOTFILES_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd -P)"

# First, include settings
source ~/.bash/rust.sh

printf "\n> rust update\n"
if ! command -v rustc >/dev/null; then
    rustup toolchain install stable --profile default --component rust-src
    rustup default stable
fi

exit 0
