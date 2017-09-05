# Tools

### Generate a Self-Signed Certificate
```
openssl req \
-newkey rsa:2048 -nodes -keyout demoselfsign.key \
-x509 -days 9999 -out demoselfsign.crt
```

### user: dummy1

```
htpasswd -c /local-path/docker-stack-this/traefik-manager/traefik-config/.htpasswd dummy1
```

plain password: qPqaNokI16T/IL3wTPElw8VrIGXzesi

dummy1:$apr1$KwGgqG16$NPaFNNgqFjz3r4qIytzte/


Cheers!
Pascal | https://twitter.com/askpascalandy