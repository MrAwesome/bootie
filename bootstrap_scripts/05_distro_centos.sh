#!/bin/bash

# TODO: Don't run when not necessary

yum install -y gcc python36-pip python36-jinja2

# TODO: handle this changing the install location. Insane.
pip3 install --upgrade pip
pip install jinja2 ansible

