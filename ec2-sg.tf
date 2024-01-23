provider "aws" {
  region     = "any region you can select"
  access_key = "Your access key"
  secret_key = "Your secreat key"
}
resource "aws_instance" "web" {
  ami                    = "ami"
  availability_zone      = "depend with region you are on"
  instance_type          = "t2.micro"
  count                  = 1
  vpc_security_group_ids = [aws_security_group.TP_security_group.id]
}
resource "aws_security_group" "TP_security_group" {
  name        = "Terraform-sg"
  description = "TP security group using Terraform"


  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Terraform-sg"
  }
}


