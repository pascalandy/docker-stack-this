#!/bin/sh

# Create Swarm
docker swarm init --advertise-addr $(hostname -i) && \
docker node ls && \

# Install common apps
apk update && apk upgrade && apk add nano curl bash git wget unzip openssl tzdata ca-certificates && \

# set local time
cp /usr/share/zoneinfo/America/New_York /etc/localtime && \
echo "America/New_York" > /etc/timezone && \
apk del tzdata && \

# clean up
rm -rf /var/cache/apk/*