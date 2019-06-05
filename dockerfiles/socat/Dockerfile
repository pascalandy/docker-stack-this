FROM alpine:3.9

RUN apk update && apk upgrade && \
    apk add --no-cache socat tini && \
    rm -rf /var/cache/apk/* /tmp*

COPY ./run.sh /

RUN chmod +x /run.sh

ENTRYPOINT [ "/sbin/tini", "--" ]

CMD [ "/run.sh" ]
