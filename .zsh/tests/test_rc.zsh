ZSHRC_ROOT="./mock_root"
source ../rc.zsh

TEST::ZSHRC_RCDIR::is_defined() {
    assert "${ZSHRC_RCDIR+defined}" = "defined"
}

TEST::ZSHRC_RCDIR::is_correct() {
    assert "${ZSHRC_RCDIR}" = "${ZSHRC_ROOT}/zshrc.d"
}

TEST::rc::is_function() {
    assert "$(whence -w __zshrc::rc::rc)" = "__zshrc::rc::rc: function"
}

TEST::rc::allows_nonexistent_rcdir() {
    local ZSHRC_RCDIR='/dev/null/nothing'
    __zshrc::rc::rc
    assert $! -eq 0
}

TEST::rc::allows_empty_rcdir() {
    local ZSHRC_RCDIR='./empty_rcdir'
    __zshrc::rc::rc
    assert $! -eq 0
}

TEST::rc::loads_scripts_in_specific_order() {
    local ZSHRC_RCDIR='./mock_rcdir'
    __zshrc::rc::rc
    assert "${FOO}" = "0,1,2,10"
}

TEST::reload::is_function() {
    assert "$(whence -w __zshrc::rc::reload)" = "__zshrc::rc::reload: function"
}
