#!/bin/sh

# This script is made to run on a fresh play-with-docker node

# On play-with-docker, install common apps
apk update && apk upgrade && apk add --no-cache                         \
    nano bash git curl wget unzip openssl tar ca-certificates           && \

# On play-with-docker, clean up
rm -rf /var/cache/apk/* /tmp*                                           && \

# On play-with-docker, create Swarm manager
docker swarm init --advertise-addr $(hostname -i)                       && \

# On play-with-docker, clone repo
echo                                                                    && \
cd /root                                                                && \
git clone https://github.com/pascalandy/docker-stack-this.git           && \
cd docker-stack-this                                                    && \
echo;
