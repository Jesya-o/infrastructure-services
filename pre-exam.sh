#!/bin/bash -ex

exec > >(tee -ia pre_exam.txt) 2>&1


ansible-playbook infra.yaml -tapp,n,l,pi --diff

ansible-playbook infra.yaml --diff

ansible all -b -m reboot -a "test_command=uptime"

ansible-playbook infra.yaml --diff

date