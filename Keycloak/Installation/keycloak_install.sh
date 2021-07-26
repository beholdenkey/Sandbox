#!/bin/bash
# Created by @beholdenkey
echo "Keycloak Installation"
read -p "Continue (y/n)?" CONT
if [ "$CONT" = "y" ]; then
    echo "Acknowledged"
  else
    echo "Aborted"
  fi
echo "Update OS and Installing Dependencies"
echo "Please be Patient this may take sometime"
dnf -y update && \
    dnf -y install \
    wget
    java-16-openjdk-devel


groupadd -r keycloak
useradd -m -d /var/lib/keycloak -s /sbin/nologin -r -g keycloak keycloak

echo "Configuring Firewall"
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --zone=public --add-service=https --permanent
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --reload

mkdir -p /opt/keycloak

wget https://github.com/keycloak/keycloak/releases/download/14.0.0/keycloak-14.0.0.tar.gz -P /opt/keycloak
tar -xvzf keycloak-14.0.0.tar.gz

ln -s /opt/keycloak/keycloak-14.0.0 /opt/keycloak/current

chown keycloak: -R /opt/keycloak

chmod 700 /opt/keycloak/current/standalone

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

systemctl daemon-reload
systemctl enable keycloak
systemctl start keycloak
