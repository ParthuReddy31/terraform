resource "aws_instance" "web" {
  ami                    = local.ami_id
  instance_type          = local.instance_type
  vpc_security_group_ids = local.vpc_security
  tags = {
    Name    = "Terraform-demo"
    Purpose = "practicing terraform"
  }
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
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
