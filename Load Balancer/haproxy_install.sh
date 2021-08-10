#/bin/bash
#------------------------------------------------------------ #
# By @beholdenkey
# Compatible Operating systems: Centos 8 Stream, RHEL 8, Fedora 34
# Script to install haproxy on Fedora, CentOS, RHEL 8
#------------------------------------------------------------- #

sudo dnf -y update && \
    dnf -y install \
    wget && \
dnf groupinstall "Development Tools" -y


tar xzvf https://www.haproxy.org/download/2.4/src/haproxy-2.4.2.tar.gz -C ~/

cd ~/haproxy-2.4.2

make TARGET=linux-glibc

make install