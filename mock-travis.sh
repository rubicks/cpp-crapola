#!/usr/bin/env bash

# cpp-crapola/mock-travis.sh
#
# do what travis does
#
# http://about.travis-ci.org/docs/user/build-configuration/#Build-Lifecycle

wrap()
{
    echo && echo ${@} && eval ${@}
    ret=${?}
    if [[ "0" -ne "${ret}" ]]
    then
        echo "failure: \"${@}\" returned ${ret}"
    fi
    return ${ret}
}

echo -n                              && \
    wrap ./.travis/before_install.sh && \
    wrap ./.travis/install.sh        && \
    wrap ./.travis/before_script.sh  && \
    wrap ./.travis/script.sh

export TRAVIS_TEST_RESULT="${?}"

if [[ "0" -ne "${TRAVIS_TEST_RESULT}" ]]
then
    wrap ./.travis/after_failure.sh
else
    wrap ./.travis/after_success.sh
fi

wrap ./.travis/after_script.sh
