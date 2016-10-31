# Input Variables

## Resource tags
variable "stack_item_label" {
  type        = "string"
  description = "Short form identifier for this stack. This value is used to create the 'Name' resource tag for resources created by this stack item, and also serves as a unique key for re-use."
}

variable "stack_item_fullname" {
  type        = "string"
  description = "Long form descriptive name for this stack item. This value is used to create the 'application' resource tag for resources created by this stack item."
}

## VPC parameters
variable "vpc_id" {
  type        = "string"
  description = "ID of the target VPC."
}

variable "region" {
  type        = "string"
  description = "The AWS region"
  default     = "ap-northeast-1"
}

variable "subnets" {
  type        = "string"
  description = "List of VPC subnets to associate with the cluster."
}

## OpenVPN parameters
variable "instance_type" {
  type        = "string"
  description = "EC2 instance type to associate with the launch configuration."
  default     = "t2.small"
}

variable "key_name" {
  type        = "string"
  description = "SSH key pair to associate with the launch configuration."
}

variable "dmz_subnet_cidrs" {
  type        = "string"
  description = "DMZ subnet CIDRs"
}

variable "lan_subnet_cidrs" {
  type        = "string"
  description = "LAN subnet CIDRs"
}

variable "s3_bucket" {
  type        = "string"
  description = "The S3 bucket where certificate and configuration are stored."
}

variable "s3_bucket_prefix" {
  type        = "string"
  description = "The S3 bucket prefix. Certificates and configuration will be sourced from the root if not configured."
}

variable "cidr_whitelist" {
  type        = "string"
  description = "Limit access to the designated list of CIDRs"
  default     = "0.0.0.0/0"
}

# DNS parameters
variable "dns_hosted_zone" {
  type        = "string"
  description = "The ID of the hosted zone to contain this record."
}

variable "dns_name" {
  type        = "string"
  description = "The name of the DNS record."
}

variable "ami_custom" {
  type = "string"

  /* TODO: this needs to be a dynamic default */
  default = "ami-7b62c11a"
}
