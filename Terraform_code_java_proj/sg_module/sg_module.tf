variable vpcid { }

resource "aws_security_group" "git_dock_jen" {
  name        = "git_dock_jen"
  description = "Security group for git,dock and jen instance"
  vpc_id      = var.vpcid

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "git_dock_jen"
  }
}

resource "aws_security_group" "ansible_pvt" {
  name        = "ansible_pvt"
  description = "Security group for ansible-pvt instance"
  vpc_id      = var.vpcid

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Ansible-pvt"
  }
}

resource "aws_security_group" "k8_sg" {
  name        = "k8_sg"
  description = "Security group for git,dock and jen instance"
  vpc_id      = var.vpcid

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "k8_sg"
  }
}

output "sg_op_gdj" {
  value = aws_security_group.git_dock_jen.id
}

output "sg_op_ans" {
  value = aws_security_group.ansible_pvt.id
}

output "sg_op_k8" {
  value = aws_security_group.k8_sg.id
}
