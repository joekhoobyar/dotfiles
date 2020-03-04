#!/bin/sh
#
# helm
#
# This updates helm dependencies.
set -ex

DOTFILES_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd -P)"

have_helm_plugin() {
    helm plugin list | cut -f 1 | tr -d '[:blank:]' | grep -q "^$1\$"
}

helm_plugin() {
    local repo="$1" name="$2"
    [ -z "$name" ] && name="$(basename "$repo" .git)"
    printf "  + $name\n"
    if have_helm_plugin "$name"; then
        helm plugin update "$name"
    else
        helm plugin install "$repo"
    fi
}

printf "\n> helm plugin update\n"
helm_plugin https://github.com/aslafy-z/helm-git.git
helm_plugin https://github.com/databus23/helm-diff diff

exit 0
