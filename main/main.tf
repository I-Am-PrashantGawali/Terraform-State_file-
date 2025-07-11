provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-098b6003ed590239f"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "prashant" {
  ami                    = "ami-0f918f7e67a3323f0"
  instance_type          = "t2.micro"
  key_name               = "MumbaiEc2"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "state_file_checking"
  }
}

output "public_ip" {
  description = "Public IP for EC2 instance"
  value       = aws_instance.prashant.public_ip
}
