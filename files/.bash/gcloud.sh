if [[ -n "${ZSH_VERSION:-}" ]]; then
    source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
    source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
else
    source "$(brew --prefix)/share/google-cloud-sdk/path.bash.inc"
    source "$(brew --prefix)/share/google-cloud-sdk/completion.bash.inc"
fi
