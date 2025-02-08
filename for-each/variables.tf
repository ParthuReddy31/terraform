variable "instance_type" {
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "zone_id" {
    default = "Z050580338HWTHU4MUZ8C"
}

variable "domain_name" {
    default = "parthudevops.space"
}

variable "pub_id" {
    default = "frontend"
}