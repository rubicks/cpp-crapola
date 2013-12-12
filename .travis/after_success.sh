#!/usr/bin/env bash

# cpp-crapola/.travis/after_success.sh

# env | sort

# exit 0

[ "master" == "${TRAVIS_BRANCH}" ] || exit 0

source ${PROJECT_DIR}/scripts/_do_or_die.sh || exit 1

[ "`git config user.name`" ]  || _do_or_die git config user.name "`whoami`"
[ "`git config user.email`" ] || _do_or_die git config user.name "`whoami`@`uname -n`"

_do_or_die git checkout macosx
_do_or_die git merge --no-edit master
_do_or_die git push
_do_or_die git checkout master
