#/bin/bash
#------------------------------------------------------------ #
# By @beholdenkey
# Compatible Operating systems: Centos 8 Stream, RHEL 8, Fedora 34
# Script to install Nautobot - CentOS and RHEL
#------------------------------------------------------------- #

echo "Update to Latest Python Version"

sudo dnf -y update && \
    dnf -y install \
    openssl-devel \
    libffi-devel \ 
    bzip2-devel \
    git
    
    wget && \
dnf groupinstall "Development Tools" -y

wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz

tar xvf Python-3.9.6.tgz

cd Python-3.9*/

./configure --enable-optimizations

sudo make altinstall

PATH=”$PATH:/usr/local/bin/python”

rm -rf Python-3.9.6.tgz
rm -rf Python-3.9.6
 
python3.9 --version

echo "Python has been update to 3.9.6"

