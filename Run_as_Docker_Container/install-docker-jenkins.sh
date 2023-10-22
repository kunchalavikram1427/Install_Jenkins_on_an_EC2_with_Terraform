#!/bin/bash
set -e

echo "Installing docker"
yum update -y
yum install docker -y
systemctl enable --now docker

# Start Jenkins Container
echo "Creating docker volume for Jenkins Home"
docker volume create jenkins-master-home

echo "Starting Jenkins Container"
docker run -d --restart=always --name jenkins-master -v jenkins-master-home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts

echo "Waiting for the container to start"
sleep 10

echo "Printing initial admin password"
cat /var/lib/docker/volumes/jenkins-master-home/_data/secrets/initialAdminPassword

# echo "Printing initial admin password"
# docker exec jenkins-master bash -c 'cat /var/jenkins_home/secrets/initialAdminPassword'