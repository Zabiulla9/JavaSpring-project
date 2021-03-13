#!/bin/bash
sudo apt-get update
sudo apt install tree ansible -y
sudo touch /home/ubuntu/Zabiulla.pem
cd /home/ubuntu/
sudo git clone https://github.com/Zabiulla9/Terraform-project.git
