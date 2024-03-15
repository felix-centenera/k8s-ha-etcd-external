#!/bin/bash

## Install Ansible in node bastion


yum update -y
yum upgrade -y
yum --enablerepo=extras install epel-release -y

sudo pip uninstall ansible || true
yum -y  install  pyOpenSSL python-pip python-dev sshpass python ansible # this will install ansible-2.4
sudo mkdir -p /etc/ansible
pip install --upgrade ansible  # this will install ansible-2.6



sudo pip -H install --upgrade ansible  # this will install ansible-2.6


sudo mv /tmp/ansible.cfg /etc/ansible/
sudo mv /tmp/ansible /root/
ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa

for host in  lb-one.192.168.1.149.nip.io  \
            master1.192.168.1.150.nip.io \
            master2.192.168.1.151.nip.io \
            master3.192.168.1.152.nip.io \
            etcd1.192.168.1.153.nip.io \
            etcd2.192.168.1.154.nip.io \
            etcd3.192.168.1.155.nip.io \
            worker1.192.168.1.156.nip.io \
            worker1.192.168.1.157.nip.io \
            master1.192.168.1.150.nip.io; \
            do sshpass -f /tmp/password.txt ssh-copy-id -o "StrictHostKeyChecking no" -f $host;  \
            done
