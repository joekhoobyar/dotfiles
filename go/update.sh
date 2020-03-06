#!/bin/sh
#
# go
#
# This updates go dependencies.
set -e

DOTFILES_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd -P)"

# First, include settings
source $DOTFILES_REPO/files/.bash/golang.sh

printf "\n> golang update\n"
go get golang.org/x/tools/cmd/godoc

exit 0
