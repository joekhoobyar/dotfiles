#!/bin/bash -l
#
# java
#
# This updates java plus dependencies.
set -e

DOTFILES_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd -P)"

printf "\n> sdkman update\n"
if ! command -v sdk >/dev/null 2>&1; then
    curl -s "https://get.sdkman.io" | bash
fi
sdk selfupdate
sdk update

exit 0
