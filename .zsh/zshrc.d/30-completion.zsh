# compinit in zshcompsys(1)
autoload -U compinit
compinit -d "${ZSHRC_ROOT}/.zcompdump"

# BRACE_CCL in zshoptions(1) and BRACE EXPANSION in zshexpn(1)
setopt BRACE_CCL

# COMPLETE_ALIASES in zshoptions(1)
setopt COMPLETE_ALIASES

# CORRECT in zshoptions(1)
setopt CORRECT

# AUTO_CD in zshoptions(1)
setopt AUTO_CD

# AUTO_PUSHD in zshoptions(1)
setopt AUTO_PUSHD

# AUTO_REMOVE_SLASH in zshoptions(1)
setopt AUTO_REMOVE_SLASH

# COMPLETE_IN_WORD in zshoptions(1)
setopt COMPLETE_IN_WORD

# Tab for forward completion, Shift-Tab for backward completion
# See: reverse-menu-complete in zshcompsys(1)
bindkey "\e[Z" reverse-menu-complete

# Enable filename expansion in foo=bar style command options
# See: MAGIC_EQUAL_SUBST in zshoptions(1)
setopt MAGIC_EQUAL_SUBST

# Smart case completion
# See: CASE_GLOB in zshoptions(1)
setopt CASE_GLOB

# http://superuser.com/a/815317
#
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
# 
# See:
# - matcher-list in zshcompsys(1)
# - COMPLETION MATCHING CONTROL in zshcompwid(1)
# - FILENAME GENERATION in zshexpn(1)
zstyle ':completion:*' matcher-list                                        \
       ''                                                                  \
       '                                     m:{[:lower:]\-}={[:upper:]_}' \
       'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{[:lower:]\-}={[:upper:]_}' \
       'r:|?=**                              m:{[:lower:]\-}={[:upper:]_}'
