#!/usr/bin/env bash

# cpp-crapola/.travis/after_script.sh

env | sort

echo "\${TRAVIS_TEST_RESULT} == \"${TRAVIS_TEST_RESULT}\""
