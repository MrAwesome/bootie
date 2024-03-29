#!/bin/bash

# TODO: Allow these to be set in a file in the same dir as bs.sh,
#       source it, and then only set the ones here which aren't
#       set there. Also, allow them to be passed as command line args to bs.sh

#OLD_IFS="$IFS"
#IFS=$' \t\n\r' 

#SYSTEM_USER=${SYSTEM_USER:-"glenn"}

#if ! id -u "$SYSTEM_USER" &> /dev/null; then
#    echo -n "System password (silent): "; read -s -r SYSTEM_PASSWORD
#    USER_ALREADY_EXISTS=0
#else
#    USER_ALREADY_EXISTS=1
#fi

#echo
#echo -n "Is this a dev machine? [y/N]"; read -s -n 1 -r REPLY
#echo
#
#if [[ $REPLY =~ ^[Nn]$ ]]; then
#    IS_DEV_MACHINE=0
#else 
#    IS_DEV_MACHINE=1
#fi

#if [[ $IS_DEV_MACHINE == 1 ]]; then
#    echo $IS_DEV_MACHINE
#    echo -n "Username for GitHub: "; read -r GITHUB_USERNAME
#    echo -n "GitHub OAuth token with ssh key access (empty to try lastpass): "; read -r MAYBE_TOKEN
#    IFS="$OLD_IFS"
#
#    if [[ "$MAYBE_TOKEN" == "" ]]; then
#        logstat "Attempting lastpass."
#        echo -n "Enter email address for LastPass: "; read -r EMAIL
#        install_cmd lastpass-cli
#
#        lpass login "$EMAIL" 
#        GITHUB_OAUTH_TOKEN=$(lpass show 'GitHub OAuth' --password)
#        lpass logout
#    else 
#        GITHUB_OAUTH_TOKEN="$MAYBE_TOKEN"
#    fi
#else 
#    GITHUB_OAUTH_TOKEN=""
#    GITHUB_USERNAME=""
#fi

#export SYSTEM_USER
#export SYSTEM_PASSWORD
#export GITHUB_USERNAME
#export GITHUB_OAUTH_TOKEN
#export IS_DEV_MACHINE
#export USER_ALREADY_EXISTS
