#!/usr/bin/sh

docker run \
  --rm \
  -u root \
  -p 8500:8080 \
  -v /src/docker-system/jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins



#docker exec -it jenkins-tutorials bash

