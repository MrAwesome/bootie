#!/bin/bash 

source bootstrap_lib.sh

ansible-galaxy collection install kewlfft.aur

#ANSIBLE_AUR_BUILD_DIR=$(mktemp -d)
#logstat "Ansible AUR build dir: $ANSIBLE_AUR_BUILD_DIR"
#cd $ANSIBLE_AUR_BUILD_DIR

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

#install_ansible_aur_git() {
#    # Run this as a non-root user:
#    logstat "Installing ansible-aur-git."
#    chown "$SYSTEM_USER" "$ANSIBLE_AUR_BUILD_DIR"
#    sudo -u "$SYSTEM_USER" curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/ansible-aur-git.tar.gz
#    sudo -u "$SYSTEM_USER" tar xf ansible-aur-git.tar.gz 
#    cd ansible-aur-git 
#    # run makepkg as SYSTEM_USER:
#    sudo -u "$SYSTEM_USER" makepkg
#    echo '==='
#    pwd
#    ls
#    echo '==='
#    pacman -U ansible-aur-git*tar.zst
#    logstat "Successfully installed ansible-aur-git."
#}
#
#if ! [[ -f "/usr/share/ansible/plugins/modules/aur.py" ]]; then
#    install_ansible_aur_git
#else
#    logstat "ansible-aur-git already installed, skipping."
#fi
