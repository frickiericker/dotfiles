# See: PROMPT_SUBST in zshoptions(1)
setopt PROMPT_SUBST

# See: RPROMPT in zshparam(1) and SIMPLE PROMPT ESCAPES in zshmisc(1)
RPROMPT='${ZSHRC_VCS_SUMMARY}[%T]'

# Hook precmd (see precmd in zshmisc(1)) so that the variable
# ${zshrc::vcs_summary} is updated before shown on the prompt.
# See: add-zxsh-hool in zshcontrib(1)
autoload -Uz add-zsh-hook

zshrc::set_vcs_summary() {
    vcs_info
    ZSHRC_VCS_SUMMARY="$(eval zshrc::reformat_vcs_info ${vcs_info_msg_0_})"
}
add-zsh-hook precmd zshrc::set_vcs_summary

# See: vcs_info in zshcontrib(1)
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats           "'%u%c' '%b' ''"
zstyle ':vcs_info:git:*' actionformats     "'%u%c' '%b' '%a'"
zstyle ':vcs_info:git:*' unstagedstr       'U'
zstyle ':vcs_info:git:*' stagedstr         'C'

zshrc::reformat_vcs_info() {
    if test $# -ne 3; then
        return 1
    fi
    local change_info=$1    # %u%c
    local branch_info=$2    # %b
    local action_info=$3    # %a
    local output
    case ${change_info} in
    UC) output="! %F{red}${branch_info}%F{default}" ;;
    U)  output="* %F{red}${branch_info}%F{default}" ;;
    C)  output="! %F{green}${branch_info}%F{default}" ;;
    *)  output="* %F{green}${branch_info}%F{default}"
    esac
    if [ ! -z "${action_info}" ]; then
        output="${output}|%F{red}${action_info}%F{default}"
    fi
    echo "${output} "
}
