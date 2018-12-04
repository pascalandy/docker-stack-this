#!/usr/bin/env bash

set -o errexit
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -o errtrace
set -o nounset

### ### ### ### ### ### ### ### ### ### ###
# Functions
### ### ### ### ### ### ### ### ### ### ###

echo; echo "Remove stacks ..."
docker stack rm toolproxy || true; echo; sleep 1;

docker stack rm toolweb || true; echo; sleep 1;

docker stack rm toolmonitor || true; echo; sleep 1;

# docker stack rm toolwp || true; echo; sleep 1;


#docker stack rm proxpress || true; echo; sleep 1;

#echo; echo "Remove network ..."
#docker network rm ntw_front

#echo; echo "Clean up ..."
#docker system prune -f

# by Pascal Andy | # https://twitter.com/askpascalandy
# https://github.com/pascalandy/docker-stack-this
#