#!/usr/bin/env bash
set -o errexit
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -o errtrace
set -o nounset
###############################################################################
# Functions
###############################################################################

# setup network
NTW_FRONT=webgateway

if [ ! "$(docker network ls --filter name=$NTW_FRONT -q)" ]; then
    docker network create --driver overlay --attachable --opt encrypted "$NTW_FRONT"
    echo "Network: $NTW_FRONT was created."
else
    echo "Network: $NTW_FRONT already exist."
fi

# setup network
NTW_FRONT=traefik

if [ ! "$(docker network ls --filter name=$NTW_FRONT -q)" ]; then
    docker network create --driver overlay --attachable --opt encrypted "$NTW_FRONT"
    echo "Network: $NTW_FRONT was created."
else
    echo "Network: $NTW_FRONT already exist."
fi

# launch the stack
echo; echo;
docker stack deploy --compose-file docker-compose.yml proxy


# List
echo; echo;
echo "docker stack ls ..."
docker stack ls;
echo; echo ; sleep 2


# Follow deployment in real time
#watch docker service ls

MIN=1
MAX=8

echo; echo;
for ACTION in $(seq $MIN $MAX); do
  echo
  echo "docker service ls | Check $ACTION" of $MAX; echo;
  docker service ls && echo && sleep 2;
done
echo; echo ; sleep 2

# See Traefik logs
echo; echo;
echo "To see Traefik logs type: ";
echo "  docker service logs -f traefik_traefik"; echo;

# by Pascal Andy | # https://twitter.com/askpascalandy
# https://github.com/pascalandy/docker-stack-this
#