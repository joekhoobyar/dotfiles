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
go install golang.org/x/tools/cmd/godoc@latest
go install golang.org/x/tools/gopls@latest
command -v gox >/dev/null || go get github.com/mitchellh/gox

exit 0
