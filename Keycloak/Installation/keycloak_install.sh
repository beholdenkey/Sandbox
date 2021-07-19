#!/bin/bash
# Created by @beholdenkey
echo "Keycloak"
echo "Please be advised"
echo "System will reboot upon completion"
read -p "Continue (y/n)?" CONT
if [ "$CONT" = "y" ]; then
    echo "Acknowledged"
  else
    echo "Aborted"
  fi

dnf -y update && \
    dnf -y install \
    wget

firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --zone=public --add-service=https --permanent
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --reload

wget https://download.oracle.com/otn-pub/java/jdk/16.0.1+9/7147401fd7354114ac51ef3e1328291f/jdk-16.0.1_linux-x64_bin.rpm

dnf -y localinstall jdk-16.0.1_linux-x64_bin.rpm

cd /opt/java/

wget https://github.com/keycloak/keycloak/releases/download/14.0.0/keycloak-14.0.0.tar.gz
tar -xvzf keycloak-14.0.0.tar.gz
mv keycloak-14.0.0.tar.gz keycloak

cd