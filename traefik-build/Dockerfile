FROM traefik:1.3.8-alpine

RUN apk update && apk upgrade && \
	apk add --no-cache ca-certificates tzdata && \
    cp /usr/share/zoneinfo/America/New_York /etc/localtime &&\ 
    echo "America/New_York" > /etc/timezone &&\ 
    apk del tzdata && \
	rm -rf /var/cache/apk/*
