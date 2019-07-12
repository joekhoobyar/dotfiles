#!/bin/sh
#
# ruby
#
# This updates ruby plus dependencies.
set -e

DOTFILES_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd -P)"

printf "\n> ruby gems update\n"
gem install bundler

exit 0
