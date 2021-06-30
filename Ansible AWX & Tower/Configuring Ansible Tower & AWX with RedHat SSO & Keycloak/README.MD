# Configuring Ansible Tower/AWX with RedHat SSO / Keycloak

## Configuring Ansible Tower to use RedHat Single Sign or Keycloak

Keycloak is the upstream project for RedHat SSO. When troubleshooting look at keycloak documentation as well

Ansible AWX is the opensource free version of RedHat’s Ansible Tower.

Step 1: Create Key, Certificate, and Key Store

Follow these steps to create the key, certificate and key store to enable Ansible Tower SSO integration.

If you do not possess an X.509 enter the following on while on the awx or tower server.

>Note: You will need OpenSSL or LibreSSL on Linux.

```bash
openssl genrsa -out key.pem 2048
openssl req -new -key key.pem -out req.pem
```
