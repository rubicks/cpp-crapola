#!/usr/bin/env bash

# cpp-crapola/.travis/install.sh

if [ "${TRAVIS_BRANCH}" ]
then
    if [ "master" != "${TRAVIS_BRANCH}" ]
    then
        exit 0
    fi
fi

install()
{
    for arg in ${@}
    do
        dpkg-query -l ${arg}
        ret=${?}
        if [[ "0" -ne "${ret}" ]]
        then
            sudo apt-get --assume-yes install ${arg}
        fi
    done
}

install autoconf-archive libboost-all-dev
