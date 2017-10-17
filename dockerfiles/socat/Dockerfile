FROM alpine 3.6

RUN apk add --no-cache socat bash && \
    rm -rf /var/cache/apk/*

COPY ./run.sh /

RUN chmod +x /run.sh

CMD ["/run.sh"]