#!/usr/bin/env bash

# cpp-crapola/scripts/_install_if_missing.sh

_dir=$(dirname $(readlink -nf ${BASH_SOURCE}))
source ${_dir}/_noisy.sh     || exit 1
source ${_dir}/_do_or_die.sh || exit 1

function _install_if_missing()
{
    for arg in ${@}
    do
        echo -n                               && \
            _noisy dpkg-query --status ${arg} || \
            _do_or_die sudo apt-get --assume-yes install ${arg}
    done
}

if [ "_install_if_missing.sh" == `basename ${0}` ]
then
    _install_if_missing ${@}
fi
