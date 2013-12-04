#!/usr/bin/env bash

# cpp-crapola/.travis/install.sh

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

install libboost-all-dev
