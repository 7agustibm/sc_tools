#!/bin/bash

docker run -d -p 9000:9000 --privileged -v /var/run/docker.sock:/var/run/docker.sock --name portainer portainer/portainer
