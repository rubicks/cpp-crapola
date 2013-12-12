#!/usr/bin/env bash

# cpp-crapola/scripts/_install_if_missing.sh

source ${PROJECT_DIR}/scripts/_noisy.sh     || exit 1
source ${PROJECT_DIR}/scripts/_do_or_die.sh || exit 1

function _install_if_missing()
{
    for arg in ${@}
    do
        _noisy dpkg-query --status ${arg} || \
            _do_or_die sudo apt-get --assume-yes install ${arg}
    done
}

if [ "_install_if_missing.sh" == `basename ${0}` ]
then
    _install_if_missing ${@}
fi
