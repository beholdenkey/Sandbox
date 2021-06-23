# Keycloak Installation

Hostname: kc.automation.ntsdev.net

Username: xadmin
Password: P@ssw0rd12

Operating System - CentOS 7

VM Hardware:

- CPU - 2
- Memory - 8 GB
- Storage - 50

Network:

- IPv4 - 192.168.128.15
- Gateway - 192.168.128.1
- DNS: 8.8.8.8, 192.168.210.50, 192.168.210.51

## Related Objects

Cluster: vSAN Cluster

Resource Pool:
Networks:  - Vlan 133
Storage:

- FreeNAS
- vsanDatastore

### CentOS 7 Server Setup

- Disable KERNEL DUMP
- Configure Network
- Set Hostname
- Turn on Network Adapter

```bash
systemctl start sshd
systemctl enable sshd
```

```bash
yum update
```

Install the following

```bash
yum install net-tools nano

To manipulate the network configuration you can perform the following command. 

```bash
cd /etc/sysconfig/network-scripts/
```

Be sure to perform the following after any changes are made

```bash
systemctl restart network
```

Preparatory Work:

```bash
yum update
yum install java-1.8.0-openjdk-devel
yum install wget
yum install zip
```

## Installing Dependencies

```bash
cd /opt
wget https://jdbc.postgresql.org/download/postgresql-42.2.21.jar
```

## Install and Configure PostgreSQL Database

```bash
yum install postgresql-server
postgresql-setup --initdb
systemctl enable postgresql.service
systemctl start postgresql.service
```


Add user and group to run Keycloak:

```bash
groupadd -r keycloak
useradd -m -d /var/lib/keycloak -s /sbin/nologin -r -g keycloak keycloak
```

Create the base directory for Keycloak installation:

```bash
mkdir -p /opt/keycloak
```

Download the keycloak zip file:

```bash
wget https://github.com/keycloak/keycloak/releases/download/14.0.0/keycloak-14.0.0.zip -P /opt/keycloak
unzip keycloak-14.0.0.zip -d /opt/keycloak
```

Create a symbolic link to the keycloak installation to allow for easy switching of versions should the need arise:

```bash
ln -s /opt/keycloak/keycloak-14.0.0 /opt/keycloak/current
```

Assign permissions to keycloak folder to the user and group we created:

```bash
chown keycloak: -R /opt/keycloak
```

Lock down the standalone directory so only the keycloak user has access to it:

```bash
chmod 700 /opt/keycloak/current/standalone
```

Create a systemd configuration to start and stop keycloak using systemd:

```bash
cat > /etc/systemd/system/keycloak.service <<EOF


[Unit]
Description=Keycloak
After=network.target syslog.target
 
[Service]
Type=idle
User=keycloak
Group=keycloak
ExecStart=/opt/keycloak/current/bin/standalone.sh -b 0.0.0.0
TimeoutStartSec=600
TimeoutStopSec=600

StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=keycloak

[Install]
WantedBy=multi-user.target
' > /etc/systemd/system/keycloak.service

echo 'if $programname == "keycloak" then /var/log/keycloak/jboss.log
& stop
'>/etc/rsyslog.d/keycloak.conf
EOF
```

```bash
systemctl daemon-reload
systemctl enable keycloak
systemctl start keycloak
```

### KEYCLOAK INSTALLATION COMPLETE
