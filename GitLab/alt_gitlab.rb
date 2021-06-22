production:
[...]
    omniauth:
        # Allow login via Twitter, Google, etc. using OmniAuth providers
        enabled: true

        # Uncomment this to automatically sign in with a specific omniauth provider's without
        # showing GitLab's sign-in page (default: show the GitLab sign-in page)
        auto_sign_in_with_provider:

        # Sync user's email address from the specified Omniauth provider every time the user logs
        # in (default: nil). And consequently make this field read-only.
        # sync_email_from_provider: cas3

        # CAUTION!
        # This allows users to login without having a user account first. Define the allowed providers
        # using an array, e.g. ["saml", "twitter"], or as true/false to allow all providers or none.
        # User accounts will be created automatically when authentication was successful.
        allow_single_sign_on: [saml]

        # Locks down those users until they have been cleared by the admin (default: true).
        block_auto_created_users: true
        # Look up new users in LDAP servers. If a match is found (same uid), automatically
        # link the omniauth identity with the LDAP account. (default: false)
        auto_link_ldap_user: false

        # Allow users with existing accounts to login and auto link their account via SAML
        # login, without having to do a manual login first and manually add SAML
        # (default: false)
        auto_link_saml_user: true

        # Set different Omniauth providers as external so that all users creating accounts
        # via these providers will not be able to have access to internal projects. You
        # will need to use the full name of the provider, like `google_oauth2` for Google.
        # Refer to the examples below for the full names of the supported providers.
        # (default: [])
        external_providers: []

        ## Auth providers
        # Uncomment the following lines and fill in the data of the auth provider you want to use
        # If your favorite auth provider is not listed you can use others:
        # see https://github.com/gitlabhq/gitlab-public-wiki/wiki/Custom-omniauth-provider-configurations
        # The 'app_id' and 'app_secret' parameters are always passed as the first two
        # arguments, followed by optional 'args' which can be either a hash or an array.
        # Documentation for this is available at http://doc.gitlab.com/ce/integration/omniauth.html
        providers:
          # See omniauth-cas3 for more configuration details
          - { name: 'saml',
              label: 'gitlab.edenmal.moe Keycloak',
              groups_attribute: 'roles',
              external_groups: ['gitlab.edenmal.moe:external'],
              args: {
                      assertion_consumer_service_url: 'https://gitlab.edenmal.moe/users/auth/saml/callback',
                      idp_cert_fingerprint: 'YOUR_KEYCLOAK_CERT_FINGERPRINT',
                      idp_sso_target_url: 'https://keycloak.edenmal.moe/auth/realms/master/protocol/saml/clients/gitlab.edenmal.moe',
                      issuer: 'gitlab.edenmal.moe',
                      attribute_statements: {
                        first_name: ['first_name'],
                        last_name: ['last_name'],
                        name: ['name'],
                        username: ['name'],
                        email: ['email'] },
                      name_identifier_format: 'urn:oasis:names:tc:SAML:2.0:nameid-format:persistent' } }