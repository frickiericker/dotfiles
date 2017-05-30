# See: ZLE BUILTINS in zshzle(1)
bindkey -v

# See: accept-line in zshzle(1)
accept-line() {
    : ${BUFFER:=default}
    zle .${WIDGET} "$@"
}
zle -N accept-line

default() {
    ls -art
}

# See: REPORTTIME in zshparam(1)
REPORTTIME=3
