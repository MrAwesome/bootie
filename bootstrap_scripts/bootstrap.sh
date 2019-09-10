#!/bin/bash 

set -euo pipefail

cd $(dirname $0)

source bootstrap_lib.sh

source 01_set_vars.sh
./03_bootstrap_ansible.sh 

[[ -f ./05_distro_${DISTRO}.sh ]] && ./05_distro_${DISTRO}.sh

cd ..

# TODO: Set up the file for this, or pass the password etc on the command line.
#       Passing from command line seems dubious, but probably 
#       doesn't leave as much of a dangerous paper trail as putting them in a file.
ansible-playbook "ansible/initial_setup.yml" --extra-vars="user=${SYSTEM_USER} password=${SYSTEM_PASSWORD} github_username=${GITHUB_USERNAME} github_oauth_token=${GITHUB_OAUTH_TOKEN}"
ansible-playbook "ansible/local.yml" --extra-vars="user=${SYSTEM_USER}"

# TODO: put all this in a repo
# TODO: clone repo to some dir
# TODO: prompt for secrets, username, and put them in the right yaml files with envsubst
