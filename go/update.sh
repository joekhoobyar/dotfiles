#!/bin/sh
#
# go
#
# This updates go dependencies.
set -e

DOTFILES_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd -P)"

# First, include settings
source ~/.bash/golang.sh

printf "\n> golang update\n"
go get golang.org/x/tools/cmd/godoc
go get github.com/golang/dep/cmd/dep
command -v gox >/dev/null || go get github.com/mitchellh/gox

exit 0
