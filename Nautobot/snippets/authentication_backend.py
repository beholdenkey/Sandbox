AUTHENTICATION_BACKENDS = (
    'social_core.backends.keycloak.KeycloakOAuth2',
    'nautobot.core.authentication.ObjectPermissionBackend',
)

SOCIAL_AUTH_KEYCLOAK_KEY = 'nautobot'
SOCIAL_AUTH_KEYCLOAK_SECRET = 'ebb8db85-26d6-4ddc-a71e-1272c7e968cf'
SOCIAL_AUTH_KEYCLOAK_PUBLIC_KEY = \
    'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsAHfSJgCQmHJyhtTClLPKiq/GWNaSAt3ruaQ2f76SFQ2+5vmEVhpL2fY9sAUF6ezmzcxwe51yRzawF25RjEv5ZEM2Yv7c7lhQN2gqwuJGf8SNsLVNjk/kyAyh+/hfZEEqx2CdcQqrXmn6cuL0nov5116J6Sd0rrKtc5nvod+aBR8tHGvDhoRAhboGTwDNFBhzuehvF1Z6kvhucVOLQjJKXMvA7Rinlx3oqLWvMpmq/vYl9JBuPd+kT2t2TlzA8cO0muigNJkTZpWclb6HK23bXcdM1qI2gjg9y7IbpOFuWYc3v6R37FC//JwW1/u6RGLZ/nGU2ZXf0FdyUifyNrb9wIDAQAB'
SOCIAL_AUTH_KEYCLOAK_AUTHORIZATION_URL = \
    'http://192.168.128.11:8080/auth/realms/Blackwood/protocol/openid-connect/auth'
SOCIAL_AUTH_KEYCLOAK_ACCESS_TOKEN_URL = \
    'http://192.168.128.11:8080/auth/realms/Blackwood/protocol/openid-connect/token'
