#!/bin/bash
# Install Docker CE on CentOS 8 and CentOS 8 Stream
echo "Install Docker CE"
read -p "Continue (y/n)?" CONT
if [ "$CONT" = "y" ]; then
    echo "Acknowledged"
  else
    echo "Aborted"
  fi
sudo dnf -y update

sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

sudo dnf install docker-ce --nobest -y

sudo systemctl enable docker
sudo systemctl start docker

sudo reboot now
