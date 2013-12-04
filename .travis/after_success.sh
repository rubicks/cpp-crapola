#!/usr/bin/env bash

# cpp-crapola/.travis/after_success.sh

branch=$( git branch --list --no-color --no-column | awk '{print $2}' )

if [[ "master" -ne "${branch}" ]]
then
    exit 0
fi

echo -n                 && \
    git checkout macosx && \
    git merge master    && \
    git push            && \
    git checkout master
