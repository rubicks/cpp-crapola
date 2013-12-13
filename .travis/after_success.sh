#!/usr/bin/env bash

# cpp-crapola/.travis/after_success.sh

[ "${TRAVIS_JOB_ID}" ] || \
    echo "\${TRAVIS_JOB_ID} == \"${TRAVIS_JOB_ID}\"" && \
    exit 0
# only travis does the following (automate the merge!)

[ "master" == "${TRAVIS_BRANCH}" ] || exit 0
# build master -> merge to macosx

source ${PROJECT_DIR}/scripts/_do_or_die.sh || exit 1
source ${PROJECT_DIR}/scripts/_merge.sh     || exit 1

_do_or_die git config user.name  "Travis CI"
_do_or_die git config user.email "`whoami`@`uname -n`"
_merge macosx master
