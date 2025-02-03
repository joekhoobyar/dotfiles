#!/bin/sh
#
# python
#
# This updates python related dependencies
set -e

DOTFILES_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd -P)"

printf "\n> pip: packages\n"
pip3 install docopt playwright playwright-stealth --break-system-packages

printf "\n> playwright: install\n"
playwright install

exit 0
