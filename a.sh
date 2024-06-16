#!/bin/bash

# 备份原有的 YUM 源文件
echo "备份原有的 YUM 源文件..."
sudo mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak

# 下载 163 的 YUM 源文件
echo "下载 163 的 YUM 源文件..."
sudo wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo

# 清除 YUM 缓存并生成新的缓存
echo "清除 YUM 缓存并生成新的缓存..."
sudo yum clean all
sudo yum makecache

# 安装 SSH 服务
echo "安装 SSH 服务..."
sudo yum install -y openssh-server

# 启动并设置 SSH 服务开机自启动
echo "启动并设置 SSH 服务开机自启动..."
sudo systemctl start sshd
sudo systemctl enable sshd

# 开放 SSH 服务的防火墙端口（默认端口为 22）
echo "开放 SSH 服务的防火墙端口..."
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload

# 确认 SSH 服务正在运行
echo "确认 SSH 服务正在运行..."
sudo systemctl status sshd
