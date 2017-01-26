#!/bin/bash

mkdir /root/jenkins
chown -R 1000:1000 /root/jenkins
docker run -p 8080:8080 -p 50000:50000 -v /root/jenkins:/var/jenkins_home --name jenkins jenkins
