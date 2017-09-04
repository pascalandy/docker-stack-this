# Tools

### Self-Signed Certificate

```
openssl req \
-nodes -newkey rsa:4096 -keyout dummy1.key -out dummy1.csr -subj "/C=NL/ST=Zuid Holland/L=Rotterdam/O=Sparkling Network/OU=IT Department/CN=zxc.qwe.org";
```

### user: dummy1

```
htpasswd -c /local-path/docker-stack-this/traefik-manager/traefik-config/.htpasswd dummy1
```

plain password: qPqaNokI16T/IL3wTPElw8VrIGXzesi

dummy1:$apr1$KwGgqG16$NPaFNNgqFjz3r4qIytzte/


Cheers!
Pascal | https://twitter.com/askpascalandy