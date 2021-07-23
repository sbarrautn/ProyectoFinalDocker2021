#!/bin/bash
#help: Run queues
echo 'Running queues'

docker exec -it proyecto_api /bin/bash -c '
    php artisan queue:work --queue=default,emails --tries=5'
