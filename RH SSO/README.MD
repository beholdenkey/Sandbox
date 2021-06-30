# Red Hat SSO
Hostname: sso.jcu.ntsdev.net


Username: xadmin
Password: P@ssw0rd12

Operating System - RHEL 8

VM Hardware:

- CPU - 4
- Memory - 8 GB
- Storage - 100

Network:

- IPv4 - 192.168.128.12
- Gateway - 192.168.128.1
- DNS: 8.8.8.8, 192.168.210.50, 192.168.210.51

The main RH SSO package

```bash
wget https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=80791&product=core.service.rhsso
```

The RH SSO Patch

```bash
wget https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=98011
```
