#!/usr/bin/env bash

sudo su -c 'apt update'
sudo su -c 'apt install -y zsh git stow ansible'

ansible-playbook playbook.yml -i hosts -vv
