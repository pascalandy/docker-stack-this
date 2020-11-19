wip




### List routers

```
curl -s --user myuser:changemeplease http://localhost:8080/api/http/routers | jq
```

### webapps

add an old Apache httpd


### basic auth

Execute:

```
USER=myuser
PW=changemeplease

docker run ctr.run/github.com/firepress-org/alpine:master \
  sh -c "htpasswd -nbB ${USER} ${PW}" | sed -e 's/\$/\$\$/g'
```

Will output:

```
myuser:$$2y$$05$$jxN.6f/TMXWaf1ftsC9u2O4il1vPd5CHGW9Mi7kc3u30fpHYs57Ni
```

We use **sed** in order to duplicate the $ sign. Else, bash would interpret single $ as a variable.
  
### Generate acme.json

```bash
mkdir -pv ./configs && \
touch ./configs/acme.json && \
chmod 600 acme.json;
```

### Sources

- https://moritzvd.com/upgrade-traefik-2/
- https://containo.us/blog/traefik-2-0-docker-101-fc2893944b9d/