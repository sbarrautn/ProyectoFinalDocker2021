#!/bin/bash
#help: Runs an update and cleaning of the API product | Params: --master

API_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../../api" && pwd )"

if [ $# -gt 0  ]; then
   OPTS=`getopt --long master - "$@"`
   if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi

   # argument handling
    while (( "$#" )); do
        case "$1" in
              --master) TO_MASTER="true"; shift ;;
            --) shift; break ;;
            *) shift ;;
        esac
    done
fi

# If param --master is set, changes current branch to master and updates it.
if [ $TO_MASTER ]; then
    cd $API_DIR
    echo
    echo "Changing to master branch and pulling changes..."
    git stash && git checkout master && git pull
fi

clean_commands=(
    './composer.phar install -o'
    'php artisan clear-compiled'
    'php artisan doctrine:clear:metadata:cache'
    'php artisan doctrine:clear:query:cache'
    'php artisan doctrine:clear:result:cache'
    'php artisan doctrine:migrations:migrate'
    'php artisan migrate'
    'php artisan optimize:clear'
    'php artisan config:cache'
    'php artisan route:cache'
    'chmod -R 777 /var/www/storage'
)

for cmd in "${clean_commands[@]}"
do
   echo "Running: $cmd"
   time docker exec proyecto_api bash -c "$cmd"
   echo
   echo '----------------------------------------------------------------------------'
done

time docker exec proyecto_api bash -c "php artisan doctrine:schema:validate"
echo
echo '----------------------------------------------------------------------------'