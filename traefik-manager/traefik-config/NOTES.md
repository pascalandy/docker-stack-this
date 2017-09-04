# Tools

### Self-Signed Certificate

```
openssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem
```

### user: dummy1

```
htpasswd -c /local-path/docker-stack-this/traefik-manager/traefik-config/.htpasswd dummy1
```

plain password: qPqaNokI16T/IL3wTPElw8VrIGXzesi

dummy1:$apr1$KwGgqG16$NPaFNNgqFjz3r4qIytzte/


Cheers!
Pascal | https://twitter.com/askpascalandy