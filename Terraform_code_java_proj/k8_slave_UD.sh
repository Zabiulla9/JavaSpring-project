#!/bin/bash
sudo mkdir /home.ubuntu/software
cd /home.ubuntu/software/
sudo apt-get update
sudo apt-get install docker.io -y
sudo docker version
sudo systemctl enable docker
sudo systemctl status docker
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt-get install kubeadm kubelet kubectl -y
sudo apt-mark hold kubeadm kubelet kubectl
kubeadm version
sudo hostnamectl set-hostname worker01
