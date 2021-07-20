#!/bin/bash
# Created by @beholdenkey
echo "Keycloak Installation"
read -p "Continue (y/n)?" CONT
if [ "$CONT" = "y" ]; then
    echo "Acknowledged"
  else
    echo "Aborted"
  fi

dnf -y update && \
    dnf -y install \
    wget

firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --zone=public --add-service=https --permanent
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --reload

wget https://download.oracle.com/otn-pub/java/jdk/16.0.1+9/7147401fd7354114ac51ef3e1328291f/jdk-16.0.1_linux-x64_bin.rpm

dnf -y localinstall jdk-16.0.1_linux-x64_bin.rpm

groupadd -r keycloak
useradd -m -d /var/lib/keycloak -s /sbin/nologin -r -g 
keycloak keycloak

mkdir -p /opt/keycloak

wget https://github.com/keycloak/keycloak/releases/download/14.0.0/keycloak-14.0.0.tar.gz -P /opt/keycloak
tar -xvzf keycloak-14.0.0.tar.gz -d /opt/keycloak

ln -s /opt/keycloak/keycloak-14.0.0 /opt/keycloak/current

chown keycloak: -R /opt/keycloak

chmod 700 /opt/keycloak/current/standalone

/opt/keycloak/bin/standalone.sh -b=0.0.0.0

cat > /etc/systemd/system/keycloak.service <<EOF
[Unit]
Description=Keycloak
After=network.target

[Service]
Type=idle
User=keycloak
Group=keycloak
ExecStart=/bin/bash /opt/keycloak/current/bin/standalone.sh
TimeoutStartSec=600
TimeoutStopSec=600

[Install]
WantedBy=multi-user.target
EOF

mkdir/var/log/keycloak
useradd --system --user-group keycloak
chown -R keycloak:keycloak/opt/keycloak
chown -R keycloak:keycloak/var/log/keycloak
chmod -R g+w/opt/keycloak
chmod -R g+w/var/log/keycloak

systemctl daemon-reload
systemctl enable keycloak
systemctl start keycloak
