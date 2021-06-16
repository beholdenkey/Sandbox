## gitlab.yml configuration
#################################################################################################
gitlab_rails['time_zone'] = 'America/New_York'
#################################################################################################
### OmniAuth Settings
#################################################################################################
gitlab_rails['omniauth_enabled'] = true
gitlab_rails['omniauth_allow_single_sign_on'] = ['saml']
gitlab_rails['omniauth_block_auto_created_users'] = false
gitlab_rails['omniauth_auto_link_saml_user'] = true
gitlab_rails['omniauth_providers'] = [
  {
    name: 'saml',
    label: 'Keycloak Login',
    args: {
      assertion_consumer_service_url: 'http://192.168.99.201/users/auth/saml/callback',
      idp_cert: '-----BEGIN CERTIFICATE-----\nMII...\n-----END CERTIFICATE-----\n',
      idp_sso_target_url: 'http://192.168.128.11:8080/auth/realms/Blackwood/protocol/saml',
      issuer: 'http://192.168.99.201',
      name_identifier_format: 'urn:oasis:names:tc:SAML:2.0:nameid-format:persistent',
      attribute_statements: { username: ['username'] }
      allowed_clock_drift: 5
    }
  }
]
