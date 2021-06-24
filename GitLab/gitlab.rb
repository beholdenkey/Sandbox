## gitlab.yml configuration
#################################################################################################
gitlab_rails['time_zone'] = 'America/New_York'
#################################################################################################
### OmniAuth Settings
#################################################################################################
gitlab_rails['omniauth_enabled'] = True
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
        assertion_consumer_service_url: '',
        idp_cert: '',
        idp_sso_target_url: '',
        issuer: '',
        attribute_statements: {
            first_name: ['first_name'],
            last_name: ['last_name'],
            name: ['name'],
            username: ['name'],
            email: ['email'], }
        name_identifier_format: 'urn:oasis:names:tc:SAML:2.0:nameid-format:persistent'  
      } 
    }
  ]