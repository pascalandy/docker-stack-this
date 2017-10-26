#!/usr/bin/env bash

set -o errexit
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -o errtrace
set -o nounset

###############################################################################
# Functions
###############################################################################

#
./setup-cert.sh

#
./setup-network.sh

#
docker stack deploy traefik -c docker-compose.traefik.yml

#
docker stack deploy webapps -c docker-compose.webapps.yml