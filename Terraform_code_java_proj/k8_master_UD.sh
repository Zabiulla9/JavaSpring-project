#!/bin/bash
sudo apt-get update
cd /home/ubuntu/
sudo mkdir software
cd /home/ubuntu/software/
sudo apt-get update
sudo apt install tree zip -y
sudo apt install openjdk-8-jre-headless -y
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y
sudo systemctl status jenkins
sudo apt-get update
sudo apt-get install docker.io -y
sudo docker version
sudo systemctl enable docker
sudo systemctl status docker
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt-get install kubeadm kubelet kubectl -y
sudo apt-mark hold kubeadm kubelet kubectl
sudo kubeadm version
sudo hostnamectl set-hostname master-node
sudo touch join
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 > join
sudo mkdir -p $HOME/.kube 
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
