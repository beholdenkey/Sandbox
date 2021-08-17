#/bin/bash
#------------------------------------------------------------ #
# By @beholdenkey
# Compatible Operating systems: Centos 8 Stream
# Script to setup CentOS for Nautobot Installation
#------------------------------------------------------------- #

sudo dnf -y update && \
    dnf -y install \
    git \
    python39 \
    python39-devel \
    python39-pip \
    redis

dnf install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm -y

dnf -qy module disable postgresql

dnf install postgresql13 postgresql13-server -y

/usr/pgsql-13/bin/postgresql-13-setup initdb

systemctl start postgresql-13
systemctl enable postgresql-13

firewall-cmd --permanent --add-port=5432/tcp
firewall-cmd --reload