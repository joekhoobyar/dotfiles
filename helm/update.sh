#!/bin/sh
#
# helm
#
# This updates helm dependencies.
set -ex

DOTFILES_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd -P)"

helm3() {
    /usr/local/opt/helm@3/bin/helm "$@"
}

have_helm_plugin() {
    helm3 plugin list | cut -f 1 | tr -d '[:blank:]' | grep -q "^$1\$"
}

helm_plugin() {
    local repo="$1" name="$2"
    [ -z "$name" ] && name="$(basename "$repo" .git)"
    printf "  + $name\n"
    if have_helm_plugin "$name"; then
        helm3 plugin update "$name"
    else
        helm3 plugin install "$repo"
    fi
}

printf "\n> helm plugin update\n"
helm_plugin https://github.com/aslafy-z/helm-git.git
helm_plugin https://github.com/databus23/helm-diff diff

exit 0
