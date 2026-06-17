variable "project_name" {
  type        = string
  description = "Name tag applied to all infrastructure components"
}

variable "aws_region" {
  type        = string
  description = "AWS deployment region"
}

variable "vpc_id" {
  type        = string
  description = "The target pre-existing VPC identifier"
}

variable "public_subnet_id" {
  type        = string
  description = "The target public subnet for provisioning the bastion host"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "The target private subnets (Minimum 2 required for RDS Subnet Groups)"
}

variable "db_username" {
  type        = string
  description = "The administrative database user login ID"
}