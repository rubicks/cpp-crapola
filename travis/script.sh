#!/usr/bin/env bash

# cpp-crapola/travis/script.sh

autoconf --version

echo -n                                       && \
    mkdir --verbose --parents ./m4            && \
    mkdir --verbose --parents ./build         && \
    cd ./build                                && \
    autoreconf --verbose --force --install .. && \
    ../configure --verbose                    && \
    make --debug                              && \
    make --debug distcheck                    && \
    cd -
