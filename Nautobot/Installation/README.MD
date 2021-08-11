# Nautobot installation

<https://nautobot.readthedocs.io/en/latest/installation/nautobot/>

Preparation:

```bash
dnf -y update && \
  dnf -y install \
  nano \
  net-tools \
  epel-release -y \
```

```bash
 sudo dnf check-update
 sudo dnf install -y git python38 python38-devel python38-pip redis
```

For Latest PostgreSQL Installation
```bash
dnf install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm -y
```

Next, disable the built-in PostgreSQL module by running the following command:
```bash
dnf -qy module disable postgresql
```
Next, install PostgreSQL 13 with the following command:

```bash
dnf install postgresql13 postgresql13-server -y
```

```bash
/usr/pgsql-13/bin/postgresql-13-setup initdb
```

```bash
systemctl start postgresql-13
systemctl enable postgresql-13
```

```bash
systemctl status postgresql-13
```
