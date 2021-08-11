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

>Please note following variables can be changed as necessary. It is important to understand that these variables should be changed if you are using Nautobot for your Production IPAM requirements.

```bash
$ sudo -u postgres psql
psql (10.15)
Type "help" for help.

postgres=# CREATE DATABASE nautobot;
CREATE DATABASE
postgres=# CREATE USER nautobot WITH PASSWORD 'insecure_password';
CREATE ROLE
postgres=# GRANT ALL PRIVILEGES ON DATABASE nautobot TO nautobot;
GRANT
postgres=# \q
```

IMPORTANT:
Change the postgres user password, because by default it doesn't have one.

With a connection now established to Postgres at the psql prompt, issue the ALTER USER command to change the password for the postgres user:

```SQL
postgres=# ALTER USER postgres PASSWORD 'myPassword';
ALTER ROLE
```

If successful, Postgres will output a confirmation of ALTER ROLE as seen above.

Finally, exit the psql client by using the \q command.

```SQL
postgres=# \q
```

Verify Service Status:

You can verify that authentication works issuing the following command and providing the configured password. (Replace localhost with your database server if using a remote database.)

If successful, you will enter a nautobot prompt. Type \conninfo to confirm your connection, or type \q to exit.

```bash
$ psql --username nautobot --password --host localhost nautobot
Password for user nautobot:
psql (10.15)
Type "help" for help.

nautobot=> \conninfo
You are connected to database "nautobot" as user "nautobot" on host "localhost" (address "127.0.0.1") at port "5432".
nautobot=> \q
```
