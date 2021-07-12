# This can either be docker or podman 
docker run --detach \
             --publish 8080:80 \
             --name pulp \
             --volume "$(pwd)/settings":/etc/pulp \
             --volume "$(pwd)/pulp_storage":/var/lib/pulp \
             --volume "$(pwd)/pgsql":/var/lib/pgsql \
             --volume "$(pwd)/containers":/var/lib/containers \
             --device /dev/fuse \
             pulp/pulp