#!/bin/sh
#
# go
#
# This updates go dependencies.
set -e

DOTFILES_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd -P)"
mkdir -p $HOME/src/go

# First, include settings
source ~/.bash/golang.sh

printf "\n> golang update\n"
go install golang.org/x/tools/cmd/godoc@latest
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/onsi/ginkgo/v2/ginkgo@latest
command -v gox >/dev/null || go install github.com/mitchellh/gox@latest

exit 0
