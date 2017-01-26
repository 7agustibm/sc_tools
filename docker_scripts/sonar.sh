#!/bin/bash

docker run --name sonar-postgres -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=secret -v /root/postgres-sonar:/var/lib/postgresql -d postgres
sleep 5
docker run -it --link sonar-postgres:postgres --rm postgres sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U sonar'
docker run -d --name sonarqube --link sonar-postgres:pgsonar -p 9000:9000 -e SONARQUBE_JDBC_USERNAME=sonar -e SONARQUBE_JDBC_PASSWORD=secret -e SONARQUBE_JDBC_URL=jdbc:postgresql://pgsonar:5432/sonar sonarqube
