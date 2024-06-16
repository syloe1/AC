#!/bin/bash
sudo mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
sudo wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
sudo yum clean all
sudo yum makecache
sudo yum install -y openssh-server
sudo systemctl start sshd
sudo systemctl enable sshd
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
sudo systemctl status sshd


