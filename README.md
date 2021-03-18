# Terraform-project
This project covers DevOps tools i.e,:
* Terraform for AWS infrastructure
* Git to store repositories
* Ansible playbooks to install packages
* Jenkins to perform CI/CD operations
* Docker & K8s to deploy clusters.

# Terraform: 
steps: Create an ec2 install and install terraform and aws cli
* Change to terraform dir
* Copy/Save your pem key file
* Create an ec2 instance, install terraform and aws cli
* Create an IAM user in AWS
* Paste Access Key and Secret access key of IAM user in Terraform dir/main.tf file
* Initialize Terraform; terraform init
* Perform Terraform plan; terraform plan
* Apply terraform code; terraform apply --auto-approve

# Terraform Architecture:
* VPC, 1 Private subnet, 1 public subnet, IGW, NAT, Security groups.
* ec2-instances: Ansible in private subent, Jenkins-Docker, K8s master & K8s worker ec2 in public subnet.


# Ansible ec2 instance:
* Login to any of the public subnet's ec2 instance and save pem key file
* Login to Ansible ec2 using private IP as Ansible ec2 is in private subnet and it cannot be accessed directly.
* Save pem in /etc/ansible/<key-pair>

# Ansible ec2 instance:
* Ping ip addresses to check connection
* Run ansible playbook; to install jenkins, java, docker, maven in Jenkins-Docker ec2 instance

# Installing K8s using Playbook in K8s Master and worker ec2 instance.
* In Ansible ec2 instance:
* Run K8 install playbook
* Run K8 init playbook
* In K8 worker playbook, paste K8 master's IP address.
* Run K8 Worker playbook


# Jenkins-Docker ec2 instance:
* Configure Jenkins
* Add Maven in Global tool configuration; uncheck automatic installation and paste the maven location installed in ec2 install /usr/share/maven/
* Create a pipeline job named "java-proj"
* Create Docker credentials as Secret text in Jenkins Credentials
* Make changes in the Jenkinsfile saved in the git repo and run the file.

# K8s Master & Worker ec2 instance:
* Clone git repository where Spring-boot.yml is stored
* Change Image to java image which was pushed in the Docker hub through jenkins job.
* Run yml file using kubectl create command
* Access K8s Master IP with service port generated in the browser to see the output.
