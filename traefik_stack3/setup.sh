#!/bin/sh

yum update
yum install -y docker
service docker start
usermod -aG docker ec2-user

cd /home/ec2-user/
docker build -t api .
docker run -d -p 5000:5000 --name api api
