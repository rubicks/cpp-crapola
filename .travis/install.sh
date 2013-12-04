#!/usr/bin/env bash

# cpp-crapola/.travis/install.sh

seconds_since_last_modification()
{
    tmp=$( stat -c %Y ${@} )
    echo "\${tmp} == \"${tmp}\""
    # ret=`echo $(( $( date +%s ) - $( stat -c %Y ${@} ) ))`
    # return ret ;
}

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
