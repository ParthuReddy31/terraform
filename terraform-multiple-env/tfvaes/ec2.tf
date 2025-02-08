resource "aws_instance" "expense" {
  count = length(var.instance_name)
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project}-${var.environment}-${var.instance_name[count.index]}"
    }
  )
}
resource "aws_security_group" "allow_tls" {
  name        = "${var.project}-${var.environment}"
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
    Name = "${var.project}-${var.environment}"
  }
}
