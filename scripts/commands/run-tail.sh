#!/bin/bash
#help: Tail the error log
docker exec -it proyecto_api /bin/bash -c '
    tail -f /var/www/storage/logs/* /var/log/nginx/error.log /var/www/error.log'
