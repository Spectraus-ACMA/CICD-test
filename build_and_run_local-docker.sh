#!/bin/bash

set -e

if [ $1 == "--push" ]; then
    WILL_PUSH=1
else
    WILL_PUSH=0
fi

mkdir .pip_cache || echo '.pip_cache folder  existing'
docker buildx build \
      -t lysodocker/my-first-docker:latest \
      $( (( $WILL_PUSH == 1 )) && printf %s '--push' ) .

##### run ##########
docker run -it -p 8020:8020 \
     -e DJANGO_SUPERUSER_USERNAME=admin \
     -e DJANGO_SUPERUSER_PASSWORD=sekret1 \
     -e DJANGO_SUPERUSER_EMAIL=admin@example.com \
     django-markdown

