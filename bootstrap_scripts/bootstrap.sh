#!/bin/bash 

set -euo pipefail

cd $(dirname $0)

source bootstrap_lib.sh

source 01_set_vars.sh
./03_bootstrap_ansible.sh 

[[ -f ./05_distro_${DISTRO}.sh ]] && ./05_distro_${DISTRO}.sh

./07_clone_ansible_config

# TODO: put all this in a repo
# TODO: clone repo to some dir
# TODO: prompt for secrets, username, and put them in the right yaml files with envsubst
