#!/usr/bin/env bash

# cpp-crapola/scripts/_disp.sh

function _disp()
{
    for arg in ${@}
    do
        echo "${arg} == \"${!arg}\""
    done
}

if [ "_disp.sh" == `basename ${0}` ]
then
    _disp ${@}
fi
