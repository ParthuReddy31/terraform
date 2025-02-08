locals {
    ami_id = data.aws_ami.joindevops.id
    instance_type = "t3.micro"
    vpc_security = [aws_security_group.allow_tls.id]
}