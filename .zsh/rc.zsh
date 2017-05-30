: ${ZSHRC_RCDIR:="${ZSHRC_ROOT}/zshrc.d"}

__zshrc::rc::rc() {
    local subrc
    for subrc in ${ZSHRC_RCDIR}/*.zsh(N); do
        source "${subrc}"
    done
}

__zshrc::rc::reload() {
    source "${HOME}/.zshrc"
}
