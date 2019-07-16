#!/bin/sh

sudo docker-compose build && \
sudo docker-compose push && \
sudo docker-compose rm -f && \
sudo docker images -q | xargs sudo docker rmi 2>/dev/null
