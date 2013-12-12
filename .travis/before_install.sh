#!/usr/bin/env bash

# cpp-crapola/.travis/before_install.sh

if [ "${TRAVIS_BRANCH}" ]
then
    if [ "master" -ne "${TRAVIS_BRANCH}" ]
    then
        exit 0
    fi
fi

duration="-1"

seconds_since_last_modification()
{
    duration=$( expr $( date +%s ) - $( stat -c %Y ${@} ) )
    return ${?}
}

seconds_since_last_modification /var/lib/apt/periodic/update-success-stamp

# apt-get update (if it was run less than a week ago)
if (( "${?}" == "0" ))
then
    if (( "${duration}" < "604800" ))
    then
        exit 0 ;
    fi
fi

sudo apt-get update

