resource "aws_instance" "web" {
  ami                    = data.aws_ami.joindevops.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
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
