# terraform_route53_endpoint

Terraform module to create Route53 endpoints

## Variables

``` terraform
# name: the name of the route 53 record
variable "www_example_org" { default = "www.example.org" }

zone_id: the id of the zone
endpoint: a list of endpoints the record should point to
type: type of the record. Valid values A or CNAME
ttl: Time to live
```

## Dependency

Route53 <https://github.com/virsas/terraform_route53>

In this example I will use cloudfront endpoint. But you can use ALB, S3 or EC2 public IP instead.
CF <https://github.com/virsas/terraform_cloudfront>

## Terraform example

``` terraform
######################
# Route 53 endpoint variables
######################
variable "www_example_org" { default = "www.example.org" }

######################
# Route 53 Endpoints
######################
module "route53_www_example_org_endpoint" {
  source   = "git::https://github.com/virsas/terraform_route53_endpoint.git?ref=v1.0.0"
  zone_id  = module.route53_example_org.zone_id
  name     = var.www_example_org
  type     = "CNAME"
  ttl      = "30"
  endpoint = [ module.cloudfront_example_www.endpoint ]
}
```
