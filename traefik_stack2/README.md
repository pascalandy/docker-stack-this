# Traefik TLS and Swarm Mode Example
This example shows the configuration for Traefik under Docker Swarm Mode with
TLS termination, http to https redirection, and multiple containers mapped
with your choice of frontend rules.

## TLS Setup
For this example a self-signed TLS certificate is created in the tls folder.
It's generated with the `setup-cert.sh` script using openssl.

## Network Setup
For networking, containers need to attach to the proxy network. This is defined
externally with the `setup-network.sh` script.

## Traefik Config
The following traefik.toml was used (excluding comment lines):

```
accessLogsFile = "/dev/stdout"
defaultEntryPoints = ["https"]
[entryPoints]
  [entryPoints.http]
  address = ":80"
  [entryPoints.https]
  address = ":443"
    [entryPoints.https.tls]
      [[entryPoints.https.tls.certificates]]
      CertFile = "/run/secrets/cert.pem"
      KeyFile = "/run/secrets/key.pem"
[web]
address = ":8080"
[docker]
endpoint = "unix:///var/run/docker.sock"
domain = "localhost"
watch = true
swarmmode = true
exposedbydefault = false
```

The traefik.toml comments give more details on the configuration options, in
brief, the above options have the following results:
- accessLogsFile: This redirects the access logs to stdout where they appear 
  in `docker service logs`.
- defaultEntryPoints: This defaults containers to https only.
- entryPoints: This configures an http listener on port 80 and an https 
  listener on port 443 with the certificate in the secrets folder.
- web: This sets up a dashboard on port 8080 to see the current configuration.
- docker endpoint: This uses the docker socket to monitor the swarm manager
  for changes to running swarm services.
- docker watch: watches the above endpoint for changes.
- docker swarmmode: watches swarm services instead of docker containers
- docker exposedbydefault: disables behavior of exposing every service, only
  exposes those with `traefik.enable=true`.

## Stack Definition for Traefik
The docker-compose.traefik.yml defines Traefik's swarm mode stack. It is 
configured to run on a swarm manager so it has access to read the swarm service
state via the docker.sock mount. Traefik is published on ports 80, 443, and
8080 using the swarm ingress so you can connect to any docker node on these
ports.

The common network "proxy" is used and defined as external. You could instead
configure traefik to connect to multiple networks for different applications
so those applications could not talk to each other, only to traefik.

### Configs and Secrets
The use of configs and secrets avoids volumes that are local to the host with
the TLS certs and traefik.toml file saved. At present, these are immutable, so
making a change requires that you give that config a new name and redeploying
the stack to perform a rolling update of that change. As a benefit, should
the service migrate to another node, the configuration and/or secrets will
automatically move with it.

### Redirect workaround
The PathPrefixStrip rule is not properly redirected from http to https due to
[issue 1957](https://github.com/containous/traefik/issues/1957). The workaround
is to spin up an nginx container with a single rule to redirect anything on
http to https and make that the only rule on traefik's http frontend. This
could have also been a standalone container outside of traeifk.

## Stack Definition for Backends
Each of the web services, or in this case web servers, that you run behind 
the traefik proxy is referred to as a backend. These are configured to run on
a common network with traefik, "proxy", and with a set of labels on the service
(not the container) that traefik uses to dynamically update its configuration.

The labels we are using for traefik are:
- traefik.frontend.endPoints: The defaults to https in the traefik.toml, but
  can be overridden, e.g. the nginx http to https redirect.
- traefik.frontend.rule: This rule must be matched for traefik to send a
  request to this backend. Traefik has default priorities that may be
  overridden to handle multiple matching rules.
- traefik.docker.network: If your container is connected to multiple networks,
  this is required to be set to the network in common with traefik. Otherwise
  traefik may configure the proxy for an IP it is unable to reach.
- traefik.port: This is the port inside the container. Note that we did not
  need to publish or expose this port, traefik connects directly over the
  "proxy" network, but needs to know which port to connect to.
- traefik.enable: This is needed when we do not expose every service by
  default. If set to "true", traefik will proxy for this service.

