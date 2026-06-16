variable "project_name" {
  type        = string
  description = "Name of the project used for resource tagging"
}

variable "aws_region" {
  type        = string
  description = "Target AWS region"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the existing VPC"
}

variable "public_subnet_id" {
  type        = string
  description = "The ID of the public subnet for the bastion host"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "A list of at least two private subnet IDs for the RDS database"
}

variable "db_username" {
  type        = string
  description = "The master username for the database"
}