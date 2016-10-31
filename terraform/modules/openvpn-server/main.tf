# OpenVPN Server

## Configures AWS provider
provider "aws" {
  region = "${var.region}"
}

## Create DNS alias to ELB
resource "aws_route53_record" "dns" {
  zone_id = "${var.dns_hosted_zone}"
  name    = "${var.dns_name}"
  type    = "A"

  alias {
    name                   = "${module.openvpn_server.vpn_elb_dns_name}"
    zone_id                = "${module.openvpn_server.vpn_elb_zone_id}"
    evaluate_target_health = true
  }
}

## Creates OpenVPN instance
module "openvpn_server" {
  source = "github.com/unifio/terraform-aws-openvpn?ref=0.0.8//certs"

  # Resource tags
  stack_item_label    = "${var.stack_item_label}"
  stack_item_fullname = "${var.stack_item_fullname}"

  ## VPC parameters
  vpc_id  = "${var.vpc_id}"
  region  = "${var.region}"
  subnets = "${var.subnets}"

  ## OpenVPN parameters
  ami_custom       = "${var.ami_custom}"
  instance_type    = "${var.instance_type}"
  key_name         = "${var.key_name}"
  route_cidrs      = "${var.dmz_subnet_cidrs},${var.lan_subnet_cidrs}"
  s3_bucket        = "${var.s3_bucket}"
  s3_bucket_prefix = "${var.s3_bucket_prefix}"
  vpn_whitelist    = "${replace(var.cidr_whitelist," ","")}"
  ssh_whitelist    = "${replace(var.cidr_whitelist," ","")}"
}
