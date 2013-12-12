#!/usr/bin/env bash

# cpp-crapola/.travis/after_success.sh

# env | sort

# exit 0

[ "master" == ${TRAVIS_BRANCH} ] || exit 0

source ${PROJECT_DIR}/scripts/_do_or_die.sh
_do_or_die git checkout macosx
_do_or_die git merge master
_do_or_die git push
_do_or_die git checkout master
