#!/bin/sh

# This script is made to be run on a fresh play-with-docker node

# create Swarm
docker swarm init --advertise-addr $(hostname -i) && \

# install common apps
apk update && apk upgrade && \
apk add nano bash git wget unzip openssl tzdata ca-certificates && \

# set local time
cp /usr/share/zoneinfo/America/New_York /etc/localtime && \
echo "America/New_York" > /etc/timezone && \
apk del tzdata && \

# clean up
rm -rf /var/cache/apk/*

# Clone repo
cd /root && \
git clone https://github.com/pascalandy/docker-stack-this.git && \
cd docker-stack-this && \

echo "Time to choose your mono repo: ";
