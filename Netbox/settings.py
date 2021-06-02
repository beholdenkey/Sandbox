# These are changes that needed to be made to Netbox to integrate Python Social Auth

INSTALLED_APPS = [
    'social_django'
]

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [TEMPLATES_DIR],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.template.context_processors.media',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'utilities.context_processors.settings_and_registry',
                'social_django.context_processors.backends',  # Add this
                'social_django.context_processors.login_redirect',  # Add this
            ],
        },
    },
]

AUTHENTICATION_BACKENDS = [
    'social_core.backends.keycloak.KeycloakOAuth2',  # Add This
    'nautobot.core.authentication.ObjectPermissionBackend',  # Add This
    REMOTE_AUTH_BACKEND,
    'netbox.authentication.ObjectPermissionBackend',
]
