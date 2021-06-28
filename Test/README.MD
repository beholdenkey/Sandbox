# Test RHEL Dev Installation

Hostname: test.automation.ntsdev.net

Username: xadmin
Password: P@ssw0rd12

Operating System - RHEL 8.2

VM Hardware:

- CPU - 4
- Memory - 8 GB
- Storage - 100

Network:

- IPv4 - 192.168.128.96
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
http://subscription.rhsm.redhat.com/