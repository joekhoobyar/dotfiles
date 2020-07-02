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
command -v rustc >/dev/null || rustup-init --no-modify-path -y -c rust-src

exit 0
