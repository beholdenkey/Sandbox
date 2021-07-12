# This is interchangeable with Podman version 3

1. Start the jenkins container

```bash
docker-compose up -d
```

1.1 When you want to deploy your production file, simply run the following:

```bash
docker-compose -f docker-compose.yml -f docker-compose.production.yml up -d
```

2. Get the initial admin password

```bash
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

3. Confirm the jenkins container is running

```bash
docker ps
```

## References
