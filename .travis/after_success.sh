#!/usr/bin/env bash

# cpp-crapola/.travis/after_success.sh

env | sort

if [[ "master" -ne "${BRANCH}" ]]
then
    exit 0
fi

exit 0

echo -n                 && \
    git checkout macosx && \
    git merge master    && \
    git push            && \
    git checkout master
