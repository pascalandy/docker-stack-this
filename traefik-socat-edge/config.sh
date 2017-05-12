#!/bin/sh

PARAM=""

for file in *.yml;
do
  PARAM="$PARAM -f $file"
done

docker-compose $PARAM config > docker-compose.yaml
