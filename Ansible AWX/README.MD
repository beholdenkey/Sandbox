# Ansible AWX Installation

Hostname: awx.automation.ntsdev.net

Ansible Version 19.2.1

Username: xadmin
Password: P@ssw0rd12

Operating System - CentOS 7

VM Hardware:

- CPU - 4
- Memory - 6 GB
- Storage - 100

Network:

- IPv4 - 192.168.128.92
- Gateway - 192.168.128.1
- DNS: 8.8.8.8, 192.168.210.50, 192.168.210.51

```bash
yum update
```

```bash
systemctl enable sshd
```

```bash
systemctl start sshd
```

> Disable SELINUX

```bash
nano /etc/sysconfig/selinux

SELINUX=disabled

reboot
```

```bash
yum -y install git gcc gcc-c++ ansible nodejs gettext device-mapper-persistent-data lvm2 bzip2 python3-pip python-docker wget nano net-tools
```

```bash
wget https://download.docker.com/linux/centos/docker-ce.repo --directory-prefix /etc/yum.repos.d/
```

```bash
python --version
```

```bash
yum -y install docker-ce
```

```bash
systemctl enable docker
systemctl start docker
```

```bash
systemctl status docker
```

```bash
pip3 install setuptools_rust
pip3 install wheel
pip3 install docker-compose
```

## Download Ansible awx

```bash
cd ~
git clone -b 19.2.1 https://github.com/ansible/awx.git
```

```bash
openssl rand -base64 30
```

>Be sure to copy the key and save it for later use in the inventory file.

## Configure AWX Installation

```bash
nano ~/awx/installer/inventory
```

Find the following values and uncomment and update the values as follows.

```bash
admin_password=StrongPassword
secret_key=Paste_Your_Secret_Key_Here
pg_database=postgres
pg_password=StrongPassword
awx_alternate_dns_servers="8.8.8.8,8.8.4.4"
postgres_data_dir="/var/lib/awx/pgdocker"
docker_compose_dir="/var/lib/awx/awxcompose"
project_data_dir="/var/lib/awx/projects"
```

Type the following command to install awx

```bash
ansible-playbook -i ~/awx/installer/inventory ~/awx/installer/install.yml -v
```

Verify your containers are running

```bash
docker ps
```

## Add firewall rules

```bash
firewall-cmd --zone=public --add-masquerade --permanent
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload
```
