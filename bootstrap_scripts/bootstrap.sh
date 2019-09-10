#!/bin/bash 

set -euo pipefail

cd $(dirname $0)

source bootstrap_lib.sh

source 01_set_vars.sh
./03_bootstrap_ansible.sh 

[[ -f ./05_distro_${DISTRO}.sh ]] && ./05_distro_${DISTRO}.sh

cd ..

# TODO: set up the file for this, or pass the password etc on the command line
ansible-playbook "ansible/initial_setup.yml" --extra-vars="user=${SYSTEM_USER}"

ansible-playbook "ansible/local.yml"

# TODO: put all this in a repo
# TODO: clone repo to some dir
# TODO: prompt for secrets, username, and put them in the right yaml files with envsubst
