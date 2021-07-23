#!/bin/bash
#help: Starts all containers with docker-compose
DOCKER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../" && pwd )"

cd $DOCKER_DIR ; docker-compose up -d; cd  -
