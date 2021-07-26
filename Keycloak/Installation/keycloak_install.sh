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
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --reload

wget https://download.java.net/java/GA/jdk16.0.2/d4a915d82b4c4fbb9bde534da945d746/7/GPL/openjdk-16.0.2_linux-x64_bin.tar.gz

tar zxvf openjdk-16.0.2_linux-x64_bin.tar.gz
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
