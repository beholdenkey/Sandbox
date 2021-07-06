DATABASES = {
    "default": {
        "NAME": os.getenv("NAUTOBOT_DB_NAME", "nautobot"),  # Database name
        "USER": os.getenv("NAUTOBOT_DB_USER", "nautobot"),  # Database username
        # Database password
        "PASSWORD": os.getenv("NAUTOBOT_DB_PASSWORD", "P@ssw0rd12"),
        "HOST": os.getenv("NAUTOBOT_DB_HOST", "localhost"),  # Database server
        # Database port (leave blank for default)
        "PORT": os.getenv("NAUTOBOT_DB_PORT", "5432"),
        # Database timeout
        "CONN_MAX_AGE": int(os.getenv("NAUTOBOT_DB_TIMEOUT", 300)),
        # Database driver (Postgres only supported!)
        "ENGINE": "django.db.backends.postgresql",
    }
}
