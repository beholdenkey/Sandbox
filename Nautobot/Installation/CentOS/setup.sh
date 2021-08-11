#!/bin/bash
#------------------------------------------------------------ #
# By @beholdenkey
# Compatible Operating systems: Centos 8 Stream, RHEL 8, Fedora 34
# Script to install Nautobot - CentOS and RHEL
#------------------------------------------------------------- #

echo 'Updating OS and Installing System Packages'
sudo dnf -y update && \
    dnf -y install \
    git \
    python39 \
    python39-devel \
    python39-pip \
    redis \
    https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

echo 'Disabling Base OS PostgreSQL Module'
dnf -qy module disable postgresql

echo 'Installing PostgreSQL 13'
dnf install postgresql13 postgresql13-server -y

echo 'Initializaing Database'
/usr/pgsql-13/bin/postgresql-13-setup initdb