# Nautobot Installation

Step 1:
Run the setup.sh script to install the required system packages

Step 2:

Initialize the postgresql database

```bash
/usr/pgsql-13/bin/postgresql-13-setup initdb
```

Step 3: Configure Authentication:

CentOS/RHEL configures PostgreSQL to use ident host-based authentication by default. Because Nautobot will need to authenticate using a username and password, we must update pg_hba.conf to support md5 password authentication.

As root, edit /var/lib/pgsql/data/pg_hba.conf and change ident to md5 for the lines below.

Before:

```bash
# IPv4 local connections:
host    all             all             127.0.0.1/32            ident
# IPv6 local connections:
host    all             all             ::1/128                 ident
```

After:

```bash
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5
# IPv6 local connections:
host    all             all             ::1/128                 md5
```

```bash
systemctl start postgresql-13
systemctl enable postgresql-13
```

```bash
systemctl status postgresql-13
```

Step 4: Create Database: