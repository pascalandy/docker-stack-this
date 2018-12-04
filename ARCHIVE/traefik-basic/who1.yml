version: "3"

services:
  who1:
    image: emilevauge/whoami
    networks:
      - ntw_front
    deploy:
      replicas: 3
      labels:
        - "traefik.backend=who1"
        - "traefik.port=80"
        - "traefik.frontend.rule=PathPrefixStrip:/who1"
        - "traefik.docker.network=ntw_front"

networks:
  ntw_front:
    external: true

