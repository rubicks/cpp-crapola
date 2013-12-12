#!/usr/bin/env bash

# cpp-crapola/mock-travis.sh
#
# do what travis does
#
# http://about.travis-ci.org/docs/user/build-configuration/#Build-Lifecycle

export TRAVIS_BUILD_DIR=$(dirname $(readlink -nf ${BASH_SOURCE}))
export _system_name="Ubuntu"

export PROJECT_DIR=${TRAVIS_BUILD_DIR}
source ${PROJECT_DIR}/scripts/_noisy.sh

echo -n                                && \
    _noisy ./.travis/before_install.sh && \
    _noisy ./.travis/install.sh        && \
    _noisy ./.travis/before_script.sh  && \
    _noisy ./.travis/script.sh

export TRAVIS_TEST_RESULT="${?}"

if [[ "0" -ne "${TRAVIS_TEST_RESULT}" ]]
then
    _noisy ./.travis/after_failure.sh
else
    _noisy ./.travis/after_success.sh
fi

_noisy ./.travis/after_script.sh
