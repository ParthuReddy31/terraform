variable "project" {
    default = "expense"
}

variable "environment" {
    
}

variable "instance_name" {
    default = ["mysql","backend","frontend"]
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

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
        terraform = true
    }

}