#!/bin/sh

# This script is made to run on a fresh play-with-docker node

# install common apps
apk update && apk upgrade && apk add --no-cache                     \
    nano bash git curl wget unzip openssl tar tzdata                \
    ca-certificates                                                 && \

# set local time
cp /usr/share/zoneinfo/America/New_York /etc/localtime              && \
echo "America/New_York" > /etc/timezone                             && \
apk del tzdata                                                      && \

# clean up
rm -rf /var/cache/apk/* && sleep 1                                  && \

# create Swarm manager
docker swarm init --advertise-addr $(hostname -i)                   && \

# Clone repo
echo                                                                && \
cd /root                                                            && \
git clone https://github.com/pascalandy/docker-stack-this.git       && \
cd docker-stack-this                                                && \
echo                                                                && \
echo "The host is setup"                                            && \
echo "Time to select a monorepo (ie traefik_stack5) "               && \
echo                                                                ;