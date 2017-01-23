#!/bin/bash

# source: https://gist.github.com/andylibrian
sudo apt-get update
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual docker-engine python-pip git
sudo service docker start
sudo usermod -aG docker $USER
sudo pip install --upgrade pip
sudo pip install docker-compose
sg docker -c "docker run hello-world" && echo "Docker has been installed and is working correctly"
sg docker -c "bash"
