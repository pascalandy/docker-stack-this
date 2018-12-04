#!/usr/bin/env bash

set -o errexit
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -o errtrace
set -o nounset

###############################################################################
# Functions
###############################################################################

NTW_FRONT=proxy

if [ ! "$(docker network ls --filter name=$NTW_FRONT -q)" ]; then
    docker network create --driver overlay --attachable --opt encrypted "$NTW_FRONT"
    echo "Network: $NTW_FRONT was created."
else
    echo "Network: $NTW_FRONT already exist."
fi