provider "aws" {
  region = var.region
}

resource "aws_instance" "my_instance" {
  ami           = "ami-xxxxxxxxxxxxxxxxx" # Coloque o ID da AMI desejada
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.my_instance_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y docker.io
              sudo docker run -p 80:80 -p 443:443 httpd
              EOF

  tags = {
    Name = "my_instance"
  }
}

resource "aws_security_group" "my_instance_sg" {
  name        = "my_instance_sg"
  description = "Security group for my_instance"

  ingress {
    from_port   = 80
    to_port     = 80
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
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }
}
