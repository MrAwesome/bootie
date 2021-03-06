#!/bin/bash

set -euo pipefail

REPO="https://github.com/MrAwesome/bootie.git"

if [[ "$(whoami)" != "root" ]]; then
    echo 'This script must be run by root.' >&2
    exit 1
fi

### Distro check ##############
SUPPORTED_DISTROS=("arch" "centos" "debian")

export DISTRO=$(source /etc/os-release && echo $ID)
if [[ "$DISTRO" == "fedora" || "$DISTRO" == "rhel" ]]; then 
    DISTRO="centos"
fi

if [[ "$DISTRO" == "ubuntu" ]]; then 
    DISTRO="debian"
fi

if ! [[ " ${SUPPORTED_DISTROS[*]} " == *"$DISTRO"* || "$DISTRO" == "" ]]; then
    echo "Distro '$DISTRO' not supported. Must be one of: ${SUPPORTED_DISTROS[*]}" >&2
    exit 64
fi
################################

if [[ "$DISTRO" == "arch" ]]; then
    install_cmd() {
        pacman -S $*
    }
elif [[ "$DISTRO" == "centos" ]]; then 
    install_cmd() {
        yum install -y $*
    }
elif [[ "$DISTRO" == "debian" ]]; then 
    install_cmd() {
        apt-get install -y $*
    }
fi
export -f install_cmd

if ! command -v git &> /dev/null; then
    install_cmd git
fi

chmod +x bootstrap_scripts/*.sh
./bootstrap_scripts/bootstrap.sh
