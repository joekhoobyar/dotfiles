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

function k_delete_evicted() {
    kubectl get pod "$@" | grep Evicted | awk '{print $1}' | xargs kubectl delete pod "$@"
}

function kn_delete_evicted() {
    kubectl get pods -A | grep Evicted | awk '{print $2 " -n " $1}' | xargs -n 3 kubectl delete pod
}

# Using krew
eval "$(direnv hook bash)"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
