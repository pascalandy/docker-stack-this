#!/usr/bin/env bash

set -o errexit
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -o errtrace
set -o nounset

###############################################################################
# Functions
###############################################################################

# webapps
docker stack deploy toolweb -c toolweb-update.yml
echo; echo; sleep 2

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
