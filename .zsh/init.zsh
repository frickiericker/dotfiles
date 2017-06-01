ZSHRC_ROOT="${${(%):-%x}:a:h}"

source "${ZSHRC_ROOT}/rc.zsh"
source "${ZSHRC_ROOT}/plugin.zsh"

zshrc() {
    local subcommand=help
    if [ $# -gt 0 ]; then
        subcommand=$1
        shift 1
    fi
    case "${subcommand}" in
    plugin)
        __zshrc::plugin::plugin "$@"
        ;;
    update)
        __zshrc::plugin::update
        __zshrc::rc::reload
        ;;
    reload)
        __zshrc::rc::reload
        ;;
    help)
        __zshrc::help
        ;;
    *)  echo "unrecognized subcommand: ${subcommand}" >&2
        return 1
    esac
}

__zshrc::help() {
<< EOS
zshrc plugin <origin> - install plugin
zshrc update          - update all plugins
zshrc reload          - reload .zshrc
zshrc help            - print this message
EOS
}

__zshrc::rc::rc
