# See: HIST_IGNORE_DUPS in zshoptions(1)
setopt HIST_IGNORE_DUPS

# See: HIST_IGNORE_SPACE in zshoptions(1)
setopt HIST_IGNORE_SPACE

# Move the cursor to the end of the line on showing each line of the history.
# See: history-search-end in zshcontrib(1)
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# See: PARAMETERS USED BY THE SHELL in zshparam(1) and
# SHARE_HISTORY in zshoptions(1)
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${ZSHRC_ROOT}/.zsh_history"
setopt SHARE_HISTORY
