#!/bin/sh

## put this in Dockerfile
#COPY extra/install_docker.sh /tmp/
#RUN /bin/bash /tmp/install_docker.sh && rm /tmp/install_docker.sh
#VOLUME /var/lib/docker

## run docker with
#-v /var/run/docker.sock:/var/run/docker.sock \

curl -fsSL https://get.docker.com | bash