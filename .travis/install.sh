#!/usr/bin/env bash

# cpp-crapola/.travis/install.sh

source ${PROJECT_DIR}/scripts/_disp.sh               || exit 1
source ${PROJECT_DIR}/scripts/_install_if_missing.sh || exit 1

case "${_system_name}" in
    Ubuntu)
        _install_if_missing  \
            autoconf-archive \
            libboost-dev
        ;;
    OSX)
        _install_if_missing  \
            autoconf-archive \
            boost
        ;;
    *)
        _disp _system_name
        exit 1
esac
