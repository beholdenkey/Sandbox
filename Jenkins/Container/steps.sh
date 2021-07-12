# This is interchangable with Podman version 3

# Start the my-jenkins-3 container
docker-compose up -d

# Get the initial admin password
docker exec my-jenkins-3 cat /var/jenkins_home/secrets/initialAdminPassword

# Confirm the my-jenkins-3 container is running
docker ps

# Source https://adamtheautomator.com/jenkins-docker/