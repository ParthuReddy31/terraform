resource "aws_instance" "web" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = lookup(var.instance_type, terraform.workspace)
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name    = "Terraform-demo-${terraform.workspace}"
    Purpose = "practicing terraform"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls_${terraform.workspace}"
  description = "Allow TLS inbound traffic and all outbound traffic"


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "allow_tls"
  }
}
