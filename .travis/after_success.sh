#!/usr/bin/env bash

# cpp-crapola/.travis/after_success.sh

source ${PROJECT_DIR}/scripts/_disp.sh      || exit 1
source ${PROJECT_DIR}/scripts/_do_or_die.sh || exit 1
source ${PROJECT_DIR}/scripts/_quiet.sh     || exit 1
#source ${PROJECT_DIR}/scripts/_merge.sh     || exit 1

_disp TRAVIS_COMMIT TRAVIS_BRANCH

if [ "${TRAVIS_COMMIT}" ]
then
    echo "TRAVIS_COMMIT defined"
else
    echo "TRAVIS_COMMIT undefined"
    exit 0
fi
    
if [ "master" == "${TRAVIS_BRANCH}" ]
then
    echo "TRAVIS_BRANCH is master"
else
    echo "TRAVIS_BRANCH is not master"
    exit 0
fi


# only travis does the following (automate the merge!)


[ "`git config user.name`" ]  || \
    _do_or_die git config user.name  'Travis-CI'

[ "`git config user.email`" ] || \
    _do_or_die git config user.email "`whoami`@`uname -n`"

_branch_orig=$(git rev-parse --abbrev-ref HEAD)
_do_or_die git checkout macosx
_do_or_die git pull
_do_or_die git merge --no-edit master

#_quiet git config branch.macosx.remote "https://${GITHUB_TOKEN}@github.com/rubicks/cpp-crapola.git"
echo && echo "attempting git push..."                                   && \
    git push                                                               \
    --quiet                                                                \
    --repo="https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git"    \
    2>&1 > /dev/null                                                    && \
    echo "   ...git push success"                                       || \
    echo "   ...git push failure"
    

_do_or_die git checkout ${_branch_orig}


# _do_or_die git config credential.helper "store --file=.git/credentials"
# echo  > .git/credentials

# _merge macosx master
