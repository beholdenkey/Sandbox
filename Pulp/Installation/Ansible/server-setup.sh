# These commands need to be run prior to running the pulp installer ansible playbook. 

sudo systemctl enable --now sshd

sudo dnf -y update && \
  dnf -y install \
  nano \
  net-tools \
  epel-release \
  openssl-devel \
  libffi-devel \
  bzip2-devel \
  wget \

dnf groupinstall "Development Tools" -y

# dnf -y install epel-release
 sudo dnf -y install ansible
# dnf groupinstall "Development Tools" -y
dnf install openssl-devel libffi-devel bzip2-devel wget -y

wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz

tar xvf Python-3.9.6.tgz

cd Python-3.9*/

./configure --enable-optimizations

sudo make altinstall

PATH=”$PATH:/usr/local/bin/python”

python3.9 --version
# To upgrade to ansible-core:
pip3.9 uninstall ansible-base
pip3.9 install ansible-core
# To upgrade to Ansible 4:
pip3.9 uninstall ansible-base
pip3.9 install ansible

# 1 - Install the pulp_installer collection:

ansible-galaxy collection install pulp.pulp_installer

# 2 - Install the geerlingguy.postgresql role:

ansible-galaxy install geerlingguy.postgresql

# 3 - Write the following playbook:

nano install.yml


# 4 - Open firwall

firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --permanent --add-port=80/tcp
 firewall-cmd --reload