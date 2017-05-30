TEST_FILE=$1
TEST_EXIT_CODE=0

# These options interfere with assertions.
unsetopt EQUALS
unsetopt EXTENDED_GLOB

do_assert() {
    local location="${TEST_FILE} $1:$2"
    shift 2
    if test "$@"; then
        print -Pn '%F{g}PASS%F{default} '
        echo -E "${location}"
    else
        print -Pn '%F{r}FAIL%F{default} '
        echo -E "${location}: $*"
        TEST_EXIT_CODE=1
    fi
}
alias assert='do_assert $0 ${LINENO} "$@"'

source "${TEST_FILE}"

for test_case in $(functions -m + 'TEST::*'); do
    ${test_case}
done

exit ${TEST_EXIT_CODE}
