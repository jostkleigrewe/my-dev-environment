#!/bin/bash
set -e

# Run Ansible playbook
ansible-playbook -i inventory/localhost.yml playbooks/setup.yml


#
##!/bin/bash
#
#echo "Provisioning WSL Ubuntu..."
#ansible-playbook -i localhost, tools/ansible/playbooks/setip.yml
#
#echo "Starting Docker containers..."
#docker compose --env-file .env up -d --build
#
#
