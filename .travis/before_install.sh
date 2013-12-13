#!/usr/bin/env bash

# cpp-crapola/.travis/before_install.sh

[ "${TRAVIS_JOB_ID}" ] || exit 0
# only travis does the following (updates take time)

source ${PROJECT_DIR}/scripts/_do_or_die.sh || exit 1

case "${_system_name}" in
    Ubuntu)
        update_cmd="sudo apt-get -q update"
        ;;
    OSX)
        update_cmd="brew update"
        ;;
    *)
        _disp _system_name
        exit 1
esac

_do_or_die ${update_cmd}

# duration="604800"
# seconds_since_last_modification()
# {
#     duration=$( expr $( date +%s ) - $( stat -c %Y ${@} ) )
#     return ${?}
# }

# _file="/var/lib/apt/periodic/update-success-stamp"

# [ -f ${_file} ] && seconds_since_last_modification ${_file}

# (( "${duration}" < "604800" )) && exit 0

