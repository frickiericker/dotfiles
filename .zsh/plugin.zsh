: ${ZSHRC_PLUGDIR:="${ZSHRC_ROOT}/plugins"}

__zshrc::plugin::plugin() {
    __zshrc::plugin::init
    __zshrc::plugin::fetch "$1"
    __zshrc::plugin::load "$1"
}

__zshrc::plugin::identify_origin() {
    local origin=$1
    set -A $2 "https://${origin}"
    set -A $3 "${origin}"
    set -A $4 "${origin:t}"
}

__zshrc::plugin::init() {
    if [ -d "${ZSHRC_PLUGDIR}/.git" ]; then
        return
    fi
    mkdir -p "${ZSHRC_PLUGDIR}"
    pushd -q "${ZSHRC_PLUGDIR}"
    git init
    git config --local user.name "nobody"
    git config --local user.email "nobody@example.com"
    popd -q
}

__zshrc::plugin::fetch() {
    local plugin_origin=$1
    local plugin_uri
    local plugin_relpath
    local plugin_name
    __zshrc::plugin::identify_origin "${plugin_origin}" plugin_uri plugin_relpath plugin_name

    pushd -q "${ZSHRC_PLUGDIR}"
    if [ ! -d "${plugin_relpath}" ]; then
        mkdir -p "${plugin_relpath:h}"
        git submodule add "${plugin_uri}" "${plugin_relpath}" &&
        git commit -m "Add ${plugin_origin}"
    fi
    popd -q
}

__zshrc::plugin::update() {
    pushd -q "${ZSHRC_PLUGDIR}"
    git submodule update --remote &&
    git add -u                    &&
    git commit -m "Update plugins"
    popd -q
}

__zshrc::plugin::load() {
    local plugin_uri
    local plugin_relpath
    local plugin_name
    __zshrc::plugin::identify_origin "$1" plugin_uri plugin_relpath plugin_name

    local plugin_path="${ZSHRC_PLUGDIR}/${plugin_relpath}"
    local script_candidates=(
        "${plugin_name}.zsh"
        "${plugin_name}.plugin.zsh"
        "init.zsh"
    )
    local script
    for script in ${plugin_path}/${^script_candidates}; do
        if [ -f "${script}" ]; then
            source "${script}"
            break
        fi
    done
}
