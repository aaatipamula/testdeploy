#!/bin/sh

if [$1 = '']
then
    echo 'Please enter a name for the Docker image/container!'
    exit 0
else
    if [ -f ./scripts/Dockerfile ]
    then 

      echo 'Building main docker container image...'
      sudo docker build -t $1 -f ./scripts/Dockerfile . 

      echo 'Starting containers...'
      docker run -d \
        -it \
        --name $1 \
        --mount type=bind,source=$(pwd)/src/data,target=/home/bot/src/data,readonly \
        $1

    else
      echo 'Please navigate to the home directory of this project'
      exit 1 

    fi
fi
