#!/bin/bash
set -e

echo "Installing Java17"
yum install java-17-amazon-corretto-devel -y

echo "Installing Jenkins"
wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum update -y
yum install jenkins -y
systemctl daemon-reload
systemctl enable --now jenkins

echo "Waiting for Jenkins to start"
sleep 10

echo "Printing initial admin password"
cat /var/lib/jenkins/secrets/initialAdminPassword