#!/bin/bash

mkdir /root/ghost
chown -R 1000:1000 /root/ghost
docker run -d -p 2368:2368 -v /root/ghost:/var/lib/ghost --name ghost ghost
