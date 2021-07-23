#!/bin/bash
#help: Starts all containers with docker-compose
DOCKER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../" && pwd )"

WEB_CONTAINER_IS_RUNNING=$(docker inspect -f '{{.State.Running}}' proyecto_web)

if $WEB_CONTAINER_IS_RUNNING
  then
      docker restart proyecto_web

      echo 'Restarting web container'
  else
      cd $DOCKER_DIR ; docker-compose up -d; cd  -
fi

docker logs -f -t --tail 0 proyecto_web
