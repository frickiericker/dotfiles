# See: IGNORE_EOF in zshoptions(1)
setopt IGNORE_EOF

zshrc::safeexit() {
    if [ ${#jobstates} -gt 0 ]; then
        case ${#jobstates} in
        1) echo -n " ** You have a running job **" ;;
        *) echo -n " ** You have ${#jobstates} running jobs **"
        esac
        zle .accept-line
        return
    fi
    exit
}

zshrc::handle_ctrl+D() {
    if [ ${CURSOR} -eq 0 ]; then
        zshrc::safeexit
    fi
}
zle -N zshrc::handle_ctrl+D

bindkey "^D" zshrc::handle_ctrl+D
