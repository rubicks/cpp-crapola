#!/usr/bin/env bash

# cpp-crapola/.travis/script.sh

source ${PROJECT_DIR}/scripts/_do_or_die.sh || exit 1

echo -n                                                          && \
    _noisy mkdir --verbose --parents ${PROJECT_DIR}/m4           && \
    _noisy autoreconf --verbose --force --install ${PROJECT_DIR} && \
    _noisy mkdir --verbose --parents ${PROJECT_DIR}/build        && \
    _noisy cd ${PROJECT_DIR}/build                               && \
    _noisy ${PROJECT_DIR}/configure --verbose                    && \
    _noisy make --debug                                          && \
    _noisy make --debug distcheck                                && \
    _noisy cd ${PROJECT_DIR}
