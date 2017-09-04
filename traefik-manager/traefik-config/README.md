### Generate a Self-Signed Certificate
```
openssl req \
-newkey rsa:2048 -nodes -keyout demoselfsign.key \
-x509 -days 9999 -out demoselfsign.crt
```