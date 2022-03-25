#!/bin/bash

REPOSITORY_NAME="theia-python"
TAG_NAME="ai"

if [[ $(docker ps -a -q  --filter ancestor=$REPOSITORY_NAME:$TAG_NAME) ]]; then
    echo "Stop and remove running containers..."
    docker stop $(docker ps -a -q --filter ancestor=$REPOSITORY_NAME:$TAG_NAME --format="{{.ID}}")
    docker rm $(docker ps -a -q --filter ancestor=$REPOSITORY_NAME:$TAG_NAME --format="{{.ID}}")
    echo "Cleanup finished"
fi

echo "Remove image with same tag ..."
docker rmi $REPOSITORY_NAME:$TAG_NAME 2> /dev/null

docker build . -t $REPOSITORY_NAME:$TAG_NAME --file ./Dockerfile
