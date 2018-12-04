#!/usr/bin/env bash

set -o errexit
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -o errtrace
set -o nounset

### ### ### ### ### ### ### ### ### ### ###
# Functions
### ### ### ### ### ### ### ### ### ### ###

echo; echo;
echo "Remove stacks ..."

echo; echo;
docker stack rm traefik || true; echo; sleep 1;

echo; echo;
docker stack rm webapps || true; echo; sleep 1;

#echo; echo "Remove network ..."
#docker network rm proxy

#echo; echo "Clean up ..."
#docker system prune -f

# by Pascal Andy | # https://twitter.com/askpascalandy
# https://github.com/pascalandy/docker-stack-this
#