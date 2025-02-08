resource "aws_route53_record" "expense" {
    count = length(var.instance_name)
    zone_id = var.zone_id
    name    = var.instance_name[count.index] == "frontend" && var.environment == "prod" ? var.domain_name : "${var.instance_name[count.index]}-${var.environment}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [var.instance_name[count.index] == "frontend" && var.environment == "prod" ? aws_instance.expense[count.index].public_ip : aws_instance.expense[count.index].private_ip]
    allow_overwrite = true
}

# resource "aws_route53_record" "frontend" {
#     zone_id = var.zone_id
#     name    = "${var.domain_name}"
#     type    = "A"
#     ttl     = 1
#     records = [aws_instance.expense[2].public_ip]
# }