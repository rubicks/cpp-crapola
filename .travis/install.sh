#!/usr/bin/env bash

# cpp-crapola/.travis/install.sh

[ "Ubuntu" == ${_system_name} ] || exit 0

source "${PROJECT_DIR}/scripts/_install_if_missing.sh" || exit 1

_install_if_missing  \
    autoconf-archive \
    libboost-all-dev
