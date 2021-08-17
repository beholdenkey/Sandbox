openssl -req -nodes -sha512 -new \
subj "/C=US/ST=NC/L=FAY/OU=jcu=CN=jcu-nautobot-01.nts.devnet" \
-key jcu-nautobot-01.nts.devnet.key \
-out jcu-nautobot-01.nts.devnet.csr

openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/C=US/ST=NC/L=FAY/OU=jcu=CN=*.nts.devnet" \
  -key ca.key \
  -out ca.crt


openssl genrsa -out jcu-nautobot-01.nts.devnet.key 4096


openssl x509 -req -sha512 -days 3650 \
-extfile v3.ext \
-CA ca.crt -CAkey ca.key -CAcreateserial \
-in jcu-nautobot-01.nts.devnet.csr \
-out jcu-nautobot-01.nts.devnet.crt

openssl x509 -inform PEM \> -in jcu-nautobot-01.nts.devnet.crt \
> -out jcu-nautobot-01.nts.devnet.cert