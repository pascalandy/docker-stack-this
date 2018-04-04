#!/usr/bin/env bash

set -o errexit
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -o errtrace
set -o nounset

###############################################################################
# Functions
###############################################################################

# Stop
echo; echo "If existing, remove stacks: "
./rundown.sh

# Create Network
echo; echo "If not existing, create our network: "

NTW_FRONT=ntw_front

if [ ! "$(docker network ls --filter name=$NTW_FRONT -q)" ]; then
    docker network create --driver overlay --attachable --opt encrypted "$NTW_FRONT"
    echo "Network: $NTW_FRONT was created."
else
    echo "Network: $NTW_FRONT already exist."
fi

echo; echo "Show network..."
docker network ls | grep "ntw_"
echo; echo; sleep 2

# The Stack
echo "Start the stacks ..."; echo; echo;

# traefik
docker stack deploy toolproxy -c toolproxy.yml
echo; echo; sleep 2

# webapps
docker stack deploy toolweb -c toolweb.yml
echo; echo; sleep 2

# portainer
docker stack deploy toolportainer -c toolportainer.yml
echo; echo; sleep 2

# wordpress
    # the system is path is at ./docker-stack5
#_MYSQL_DIR="$(pwd)/html/db/mysql"
#mkdir -p "$_MYSQL_DIR"

#docker stack deploy toolwp -c toolwp.yml
#echo; echo; sleep 2


# List
echo; echo "docker stack ls ..."
docker stack ls;
echo; echo ; sleep 2


# Follow deployment in real time
#watch docker service ls
echo; echo;

MIN=1
MAX=8
for ACTION in $(seq $MIN $MAX); do
  echo
  echo "docker service ls | Check $ACTION" of $MAX; echo;
  docker service ls && echo && sleep 2;
done
echo; echo ; sleep 2

# See Traefik logs
echo "To see Traefik logs type: "; sleep 1;
echo "  docker service logs -f toolproxy_traefik"; echo; sleep 1;

# by Pascal Andy | # https://twitter.com/askpascalandy
# https://github.com/pascalandy/docker-stack-this
