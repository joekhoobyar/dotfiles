alias k='kubectl'
alias kn='kubens'
alias kush='kubectl run -it alpine --image=alpine --restart=Never -- sh --login'

function kpn() {
    local node="$1"
    kubectl get pods --all-namespaces -o wide --field-selector spec.nodeName=$node
}

function knrp() {
    kubectl get pods --all-namespaces -o wide | grep -v Running
}

# Using krew
eval "$(direnv hook bash)"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
