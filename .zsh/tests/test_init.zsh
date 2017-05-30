source ../init.zsh

TEST::ZSH_ROOT::is_defined() {
    assert "${ZSHRC_ROOT+defined}" = "defined"
}

TEST::ZSH_ROOT::is_correct() {
    # This test is executed in ${ZSHRC_ROOT}/tests.
    local test_dir=${PWD}
    local root_dir=${test_dir:h}
    assert "${ZSHRC_ROOT}" = "${root_dir}"
}

TEST::zshrc::is_function() {
    assert "$(whence -w zshrc)" = "zshrc: function"
}
