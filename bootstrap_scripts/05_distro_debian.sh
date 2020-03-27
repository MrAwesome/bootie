#!/bin/bash

command -v dirmngr &> /dev/null || install_cmd dirmngr 
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
apt-get update
