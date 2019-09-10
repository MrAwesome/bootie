#!/bin/bash

OLD_IFS="$IFS"
IFS=$' \t\n\r' 
echo -n "System username: "; read -r SYSTEM_USER
echo -n "System password (silent): "; read -s -r SYSTEM_PASSWORD
echo
echo -n "Username for GitHub: "; read -r GITHUB_USERNAME
echo -n "GitHub OAuth token with ssh key access (empty to try lastpass):"; read -r MAYBE_TOKEN
IFS="$OLD_IFS"

if [[ "$MAYBE_TOKEN" == "" ]]; then
    logstat "Attempting lastpass."
    echo "Enter email address for LastPass: "; read -r EMAIL
    install_cmd lastpass-cli

    lpass login "$EMAIL" 
    GITHUB_OAUTH_TOKEN=$(lpass show 'GitHub OAuth' --password)
    lpass logout
else 
    GITHUB_OAUTH_TOKEN="$MAYBE_TOKEN"
fi

export SYSTEM_USER
export SYSTEM_PASSWORD
export GITHUB_USERNAME
export GITHUB_OAUTH_TOKEN