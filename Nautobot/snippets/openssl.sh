sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/pki/tls/private/nautobot.key \
  -out /etc/pki/tls/certs/nautobot.crt