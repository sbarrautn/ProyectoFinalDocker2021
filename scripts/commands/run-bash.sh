#!/bin/bash
#help: Executes a bash instance in container name

if [ $# -eq 0 ]
  then
      CONTAINER=api
  else
      echo "Running with $1"
     CONTAINER=$1
fi

docker exec -it -e COLUMNS=$COLUMNS -e LINES=$LINES -e TERM=$TERM proyecto_$CONTAINER /bin/bash
