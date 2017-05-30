ZSHRC_ROOT="./mock_root"
source ../plugin.zsh

TEST::ZSHRC_PLUGDIR::is_defined() {
    assert "${ZSHRC_PLUGDIR+defined}" = "defined"
}

TEST::ZSHRC_RCDIR::is_correct() {
    assert "${ZSHRC_PLUGDIR}" = "${ZSHRC_ROOT}/plugins"
}

TEST::identify_origin::is_function() {
    assert "$(whence -w __zshrc::plugin::identify_origin)" \
           = "__zshrc::plugin::identify_origin: function"
}

TEST::identify_origin::parses_github_origin() {
    local uri
    local path
    local name
    __zshrc::plugin::identify_origin 'github.com/nobody/nothing' uri path name
    assert "${uri}" = 'https://github.com/nobody/nothing'
    assert "${path}" = 'github.com/nobody/nothing'
    assert "${name}" = 'nothing'
}

TEST::plugin::is_function() {
    assert "$(whence -w __zshrc::plugin::plugin)" = "__zshrc::plugin::plugin: function"
}

# TODO: Test __zshrc::plugin::plugin

TEST::fetch::is_function() {
    assert "$(whence -w __zshrc::plugin::fetch)" = "__zshrc::plugin::fetch: function"
}

# TODO: Test __zshrc::plugin::fetch

TEST::load::is_function() {
    assert "$(whence -w __zshrc::plugin::load)" = "__zshrc::plugin::load: function"
}

TEST::load::loads_name_zsh() {
    local ZSHRC_PLUGDIR="./mock_plugdir"
    __zshrc::plugin::load "github.com/nobody/foo"
    assert "${+FOO_LOADED}" -eq 1
    assert "${FOO_LOADED}" = "yes"
}

TEST::load::loads_name_plug_zsh() {
    local ZSHRC_PLUGDIR="./mock_plugdir"
    __zshrc::plugin::load "github.com/nobody/bar"
    assert "${+BAR_LOADED}" -eq 1
    assert "${BAR_LOADED}" = "yes"
}

TEST::load::loads_init_zsh() {
    local ZSHRC_PLUGDIR="./mock_plugdir"
    __zshrc::plugin::load "github.com/nobody/baz"
    assert "${+BAZ_LOADED}" -eq 1
    assert "${BAZ_LOADED}" = "yes"
}

TEST::update::is_function() {
    assert "$(whence -w __zshrc::plugin::update)" = "__zshrc::plugin::update: function"
}

# TODO: Test __zshrc::plugin::update
