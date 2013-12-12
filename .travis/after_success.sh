#!/usr/bin/env bash

# cpp-crapola/.travis/after_success.sh

# env | sort

# exit 0

[ "master" == "${TRAVIS_BRANCH}" ] || exit 0
# only do the following if travis master branch

source ${PROJECT_DIR}/scripts/_do_or_die.sh || exit 1

_do_or_die git config user.name  ${GIT_NAME}
_do_or_die git config user.email ${GIT_EMAIL}
_do_or_die git checkout macosx
_do_or_die git merge --no-edit master
_do_or_die git push
_do_or_die git checkout master
