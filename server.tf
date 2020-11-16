terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region_name
}

resource "aws_security_group" "Practice_grp" {
  name        = "Practice_grp"
  description = "Jenkins and Prometheus port"

  ingress {
    description = "allow  ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow  jenkins port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allo prometheus port"
    from_port   = 9090
    to_port     = 9090
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
    Name = "Jenkins and Prometheus"
  }
}

resource "aws_instance" "EC2s" {
  ami             = var.aws_ami
  instance_type   = "t3.medium"
  security_groups = ["Practice_grp"]
  key_name        = "devops"
  user_data       = file("install_java_pip.sh")
  tags = {
    Name  = "Control_Server"
    Group = "Daily Builds"
  }
  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip}"
  }
}
