resource "aws_route53_record" "endpoint" {

  zone_id = var.zone_id
  name    = var.name
  type    = var.type
  ttl     = var.ttl

  records = var.endpoint
}