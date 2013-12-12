#!/usr/bin/env bash

# cpp-crapola/.travis/install.sh

if [ "${TRAVIS_BRANCH}" ]
then
    if [ "master" != "${TRAVIS_BRANCH}" ]
    then
        exit 0
    fi
fi

source "${PROJECT_DIR}/scripts/_install_if_missing.sh" || exit 1

_install_if_missing  \
    autoconf-archive \
    libboost-all-dev
