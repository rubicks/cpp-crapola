#!/usr/bin/env bash

# cpp-crapola/.travis/install.sh

source ${PROJECT_DIR}/scripts/_install_if_missing.sh || exit 1

case "${_system_name}" in
    Ubuntu)
        _install_if_missing  \
            autoconf-archive \
            libboost-all-dev
        ;;
    OSX)
        _install_if_missing  \
            autoconf-archive \
            boost
        ;;
    *)
        echo "environment variable \${_system_name} has undefined value \"${_system_name}\""
        exit 1
esac
