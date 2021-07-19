#!/bin/bash
# Install Docker CE on CentOS 8 and CentOS 8 Stream
echo "Install Docker CE"
read -p "Continue (y/n)?" CONT
if [ "$CONT" = "y" ]; then
    echo "Acknowledged"
  else
    echo "Aborted"
  fi
dnf -y update

dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

dnf install docker-ce --nobest -y

systemctl enable docker
systemctl start docker

reboot now
