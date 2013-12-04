#!/usr/bin/env bash

# cpp-crapola/.travis/install.sh

install()
{
    for arg in ${@}
    do
        dpkg-query -l ${arg}
        if [[ "0" -ne "" ]]
        then
            sudo apt-get --assume-yes install ${arg}
        fi
    done
}

install libboost-all-dev
