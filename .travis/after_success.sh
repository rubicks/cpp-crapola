#!/usr/bin/env bash

# cpp-crapola/.travis/after_success.sh

source ${PROJECT_DIR}/scripts/_disp.sh      || exit 1
source ${PROJECT_DIR}/scripts/_do_or_die.sh || exit 1
source ${PROJECT_DIR}/scripts/_quiet.sh     || exit 1
#source ${PROJECT_DIR}/scripts/_merge.sh     || exit 1

_disp TRAVIS_COMMIT TRAVIS_BRANCH

[ "${TRAVIS_COMMIT}" ]             || exit 0
[ "master" == "${TRAVIS_BRANCH}" ] || exit 0
# [ "clang" == "${CC}" ]             || exit 0

# get to here: travis, master branch


[ "`git config user.name`" ]  || \
    _do_or_die git config user.name  'Travis-CI'

[ "`git config user.email`" ] || \
    _do_or_die git config user.email "`whoami`@`uname -n`"

_do_or_die git checkout macosx
_do_or_die git pull
_do_or_die git merge --no-edit master

#_quiet git config branch.macosx.remote "https://${GITHUB_TOKEN}@github.com/rubicks/cpp-crapola.git"
echo && echo -n "attempting git push...   "                             && \
    git push                                                               \
    --quiet                                                                \
    --repo="https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git"    \
    2>&1 > /dev/null                                                    && \
    echo "success."                                                     || \
    echo "failure."

_do_or_die git checkout master
