#!/usr/bin/env bash

echo -n                               && \
    mkdir --verbose --parents ./build && \
    cd ./build                        && \
    autoreconf --install --verbose .. && \
    configure                         && \
    make                              && \
    make distcheck                    && \
    cd -
