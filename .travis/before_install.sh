#!/usr/bin/env bash

# cpp-crapola/.travis/before_install.sh

[ "Ubuntu" == ${_system_name} ] || exit 0

duration="-1"
seconds_since_last_modification()
{
    duration=$( expr $( date +%s ) - $( stat -c %Y ${@} ) )
    return ${?}
}

_file="/var/lib/apt/periodic/update-success-stamp"

[ -f ${_file} ] && seconds_since_last_modification ${_file}

(( "${duration}" < "604800" )) && exit 0

source ${PROJECT_DIR}/scripts/_do_or_die.sh

_do_or_die sudo apt-get -qq update
