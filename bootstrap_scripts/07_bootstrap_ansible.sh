#!/bin/bash
set -euo pipefail

command -v ansible &> /dev/null || install_cmd ansible

### For Ansible in push mode:
# CONFIG="/etc/ssh/sshd_config"
# PUBKEY='ssh-rsa yoursshkeyblah you@you'
# 
# grep -Eq '^#? ?PermitRootLogin' $CONFIG || echo 'PermitRootLogin yes' >> $CONFIG
# sed -i'' -E 's/^#? ?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
# 
# cd /root
# mkdir -p .ssh/
# [[ -f /root/.ssh/id_rsa ]] || ssh-keygen -t rsa -f /root/.ssh/id_rsa -N ""
# echo
# echo 
# cat /root/.ssh/id_rsa.pub
# echo 
# echo
# 
# touch /root/.ssh/authorized_keys
# grep -Eq "$PUBKEY" /root/.ssh/authorized_keys || echo "$PUBKEY" >> /root/.ssh/authorized_keys
###
