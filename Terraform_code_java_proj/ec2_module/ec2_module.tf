variable vpcid { }
variable sb_pub { }
variable sb_pvt { }
variable sg_git { }
variable sg_ans { }
variable sg_k8 { }

resource "aws_instance" "git_jenk_dock" {
  ami           = "ami-08962a4068733a2b6"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id     = var.sb_pub
  vpc_security_group_ids = [var.sg_git]
  key_name      = "Zabiulla"

  tags = {
    Name = "git_jenk_dock"
  }
}

data "template_file" "ansi" {
  template = file("./ansi.sh")
}

resource "aws_instance" "ansible" {
  ami           = "ami-08962a4068733a2b6"
  instance_type = "t2.micro"
  subnet_id     = var.sb_pvt
  vpc_security_group_ids = [var.sg_ans]
  key_name      = "Zabiulla"
  user_data  = data.template_file.ansi.rendered

  tags = {
    Name = "Ansible"
  }
}

data "template_file" "k8_master_UD" {
  template = file("./k8_master_UD.sh")
}

resource "aws_instance" "k8_master" {
  ami           = "ami-08962a4068733a2b6"
  instance_type = "t3.small"
  associate_public_ip_address = true
  subnet_id     = var.sb_pub
  vpc_security_group_ids = [var.sg_k8]
  key_name      = "Zabiulla"
  user_data  = data.template_file.k8_master_UD.rendered

  tags = {
    Name = "K8_Master"
  }
}

data "template_file" "k8_slave_UD" {
  template = file("./k8_slave_UD.sh")
}

resource "aws_instance" "k8_slave" {
  ami           = "ami-08962a4068733a2b6"
  instance_type = "t3.small"
  associate_public_ip_address = true
  subnet_id     = var.sb_pub
  vpc_security_group_ids = [var.sg_k8]
  key_name      = "Zabiulla"
  user_data  = data.template_file.k8_slave_UD.rendered

  tags = {
    Name = "K8_Slave"
  }
}
