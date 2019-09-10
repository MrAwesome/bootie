#!/bin/bash 

source bootstrap_lib.sh

ANSIBLE_AUR_BUILD_DIR=$(mktemp -d)
logstat "Ansible AUR build dir: $ANSIBLE_AUR_BUILD_DIR"
cd $ANSIBLE_AUR_BUILD_DIR

#install_yay() {
#    logstat "Installing yay."
#    curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
#    tar xf yay.tar.gz 
#    cd yay 
#    makepkg
#    pacman -U yay.*tar.xz
#    logstat "Successfully installed yay."
#    cd $ANSIBLE_AUR_BUILD_DIR
#}
#
#if ! command -v yay &> /dev/null; then
#    install_yay
#else
#    logstat "Yay already installed, skipping."
#fi

install_ansible_aur_git() {
    logstat "Installing ansible-aur-git."
    curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/ansible-aur-git.tar.gz
    tar xf ansible-aur-git.tar.gz 
    cd ansible-aur-git 
    makepkg
    pacman -U ansible-aur-git.*tar.xz
    logstat "Successfully installed ansible-aur-git."
    cd $ANSIBLE_AUR_BUILD_DIR
}

if ! [[ -f "/usr/share/ansible/plugins/modules/aur.py" ]]; then
    install_ansible_aur_git
else
    logstat "ansible-aur-git already installed, skipping."
fi
