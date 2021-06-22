# Keycloak Installation

Hostname: jcu.kc.ntsdev.net

Username: xadmin
Password: P@ssw0rd12

Operating System - CentOS 7

VM Hardware:

- CPU - 2
- Memory - 8 GB
- Storage - 50 Global

Network:

- IPv4 - 192.168.128.14
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
