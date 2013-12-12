#!/usr/bin/env bash

# cpp-crapola/.travis/after_success.sh

# env | sort

# exit 0

if [ "master" == "${TRAVIS_BRANCH}" ]
then
    echo -n                 && \
        git checkout macosx && \
        git merge master    && \
        git push            && \
        git checkout master
fi
