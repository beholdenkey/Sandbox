echo $NAUTOBOT_ROOT
echo $PATH
which pip3
pip3 install --upgrade pip wheel
pip3 install nautobot
nautobot-server --version
nautobot-server init
pip install nautobot-netbox-importer
pip install nornir-nautobot
pip3 install nautobot_plugin_nornir
pip3 install nautobot-golden-config
systemctl status redis
nautobot-server migrate
nautobot-server createsuperuser
nautobot-server collectstatic
nautobot-server check
nautobot-server runserver 0.0.0.0:8080 --insecure
clear
systemctl status nginx
systemctl enable --now redis
clear
redis-cli ping
dnf -y install nginx
su -i root
su -u root
su -ui root
su root
pip3 install -r $NAUTOBOT_ROOT/local_requirements.txt
nautobot-server migrate
nautobot-server collectstatic
sudo systemctl restart nautobot nautobot-worker
su root
reboot
su root
nautobot-server migrate
nautobot-server restart
nautobot-server check
nautobot-server migrate
nautobot-server collectstatic
su root
chmod 755 $NAUTOBOT_ROOT
nautobot-server migrate
nautobot-server --version
nautobot-server check
su root
nautobot-server migrate
