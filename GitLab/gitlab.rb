## gitlab.yml configuration
#################################################################################################
gitlab_rails['time_zone'] = 'America/New_York'
#################################################################################################
### OmniAuth Settings
#################################################################################################
gitlab_rails['omniauth_enabled'] = true
gitlab_rails['omniauth_allow_single_sign_on'] = ['saml']
# gitlab_rails['omniauth_sync_email_from_provider'] = 'saml'
gitlab_rails['omniauth_sync_profile_from_provider'] = ['saml']
# gitlab_rails['omniauth_sync_profile_attributes'] = ['email']
# gitlab_rails['omniauth_auto_sign_in_with_provider'] = 'saml'
gitlab_rails['omniauth_block_auto_created_users'] = false
gitlab_rails['omniauth_auto_link_ldap_user'] = false
gitlab_rails['omniauth_auto_link_saml_user'] = false
gitlab_rails['omniauth_auto_link_user'] = ['saml']
# gitlab_rails['omniauth_external_providers'] = ['twitter', 'google_oauth2']
# gitlab_rails['omniauth_allow_bypass_two_factor'] = ['google_oauth2']
gitlab_rails['omniauth_providers'] = [
  {
    name: 'saml',
    label: 'Blackwood Keycloak Login',
    group_attributes: 'roles',
    external_groups: ['gitlab.jcu:external'],
    args: {
      assertion_consumer_service_url: 'http://192.168.128.91/users/auth/saml/callback',
      idp_cert: 'MIICoTCCAYkCBgF5qlFmETANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAlCbGFja3dvb2QwHhcNMjEwNTI2MjAxMzUxWhcNMzEwNTI2MjAxNTMxWjAUMRIwEAYDVQQDDAlCbGFja3dvb2QwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCwAd9ImAJCYcnKG1MKUs8qKr8ZY1pIC3eu5pDZ/vpIVDb7m+YRWGkvZ9j2wBQXp7ObNzHB7nXJHNrAXblGMS/lkQzZi/tzuWFA3aCrC4kZ/xI2wtU2OT+TIDKH7+F9kQSrHYJ1xCqteafpy4vSei/nXXonpJ3Susq1zme+h35oFHy0ca8OGhECFugZPAM0UGHO56G8XVnqS+G5xU4tCMkpcy8DtGKeXHeiota8ymar+9iX0kG4936RPa3ZOXMDxw7Sa6KA0mRNmlZyVvocrbdtdx0zWojaCOD3Lshuk4W5Zhze/pHfsUL/8nBbX+7pEYtn+cZTZld/QV3JSJ/I2tv3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAF1H810wape6OteTcvoJB0eGa62XV6ub8+6XRHoPBql3gbnb4Qlheq+1+I1hxfkiVqvN0wUjdgJX/qDoDnGwYDojZRo8CAXs9k18wITr1ATJTpzllfPhn7jJFL/r/kuWfEkRhHBqWwQNU0Zj/qxlo2BI8831UEhaFUWUTxlXWnYihUadFReq3jPQKcOrbo/QEH+Sqy1pJBbUR70JxTVOIsOW+JYgzHCBewyPYVZaOdIHTGenmVrJsgDX1vpUmwr4pHomkgEgz1jMAlcMgvw27JAq5IbWHOoFP8mpf4S6mVS9t3PB0wGyYe849jkDQcAD5kPHLq8w83J4cdjmw0uB+DQ=',
      idp_sso_target_url: 'http://192.168.128.11:8080/auth/realms/Blackwood/protocol/saml',
      issuer: 'http://192.168.128.91',
      attribute_statements: {
          first_name: ['first_name'],
          last_name: ['last_name'],
          name: ['name'],
          username: ['name'],
          email: ['email'] },
      name_identifier_format: 'urn:oasis:names:tc:SAML:2.0:nameid-format:persistent'  
    } 
  }
]