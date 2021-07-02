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

STEP 2: Configure Ansible Tower for SAML (SSO) AuthenticationPermalink

Follow these steps to configure Ansible Tower for Security Assertion Markup Language (SAML) single sign-on (SSO) authentication.

Log in as the admin user on Ansible Tower and go to Settings > Configure Tower > Authentication > SAML

Complete the fields as shown. NOTE: Some cannot be edited.

>SAML ASSERTION CONSUMER SERVICE (ACS) URL: Cannot edit
>SAML SERVICE PROVIDER METADATA URL: Cannot edit; used to obtain tower’s SAML metadata using curl.

SAML SERVICE PROVIDER ENTITY ID: Enter the URL of the server. Note: Must match Client ID on SSO server.

SAML PROVIDER PUBLIC CERTIFICATE: Paste the saml.crt

SAML SERVICE PROVIDER PRIVATE KEY: Paste the saml.key

SAML SERVICE PROVIDER ORGANIZATION INFO:

```xml
{
 "en-US": {
  "url": "<URL OF TOWER SERVER>:<PORT IF NEEDED>",
  "displayname": "RHSSO",
  "name": "RHSSO"
 }
}
```

SAML SERVICE PROVIDER TECHNICAL CONTACT:

```xml
{
 "givenName": "<YOUR NAME>",
 "emailAddress": "<YOUR EMAIL>"
}
```

SAML SERVICE PROVIDER SUPPORT CONTACT:

```xml
{
 "givenName": "<YOUR NAME>",
 "emailAddress": "<YOUR EMAIL>"
}
```

SAML ENABLED IDENTITY PROVIDERS:

```xml
{
 "RHSSO": {
  "attr_last_name": "last_name",
  "attr_username": "username",
  "entity_id": "<SSO SERVER URL>:<PORT IF NEEDED>/auth/realms/YOUR REALM",
  "attr_user_permanent_id": "name_id",
  "url": "<SSO SERVER URL>:<PORT IF NEEDED>/auth/realms/YOUR REALM/protocol/saml",
  "attr_email": "email",
  "x509cert":  “ <PASTE THE X509 PUBLIC CERT HERE IN ONE, NON-BREAKING LINE>"
  "attr_first_name": "first_name"
 }
}
```

Note: The x509cert can be found by logging in to the SSO server and navigating to your realm’s realm settings -> keys -> and clicking Certificate under Public keys for the key store you created earlier.

>Click Save
