# Context

Based on tutorial https://www.digitalocean.com/community/tutorials/how-to-use-traefik-as-a-reverse-proxy-for-docker-containers-on-ubuntu-16-04


## create password via htpasswd

docker run -it --rm devmtl/htpasswd-fire:2.4-0 \
-m admin myfancypasswordhere

result:
admin:$apr1$aOa8/cTk$tTsbxqbEiIWaRoZyzvM4n1

