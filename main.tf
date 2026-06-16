terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "bastion_host" {
  source = "./modules/bastion_host"

  project_name       = var.project_name
  aws_region         = var.aws_region
  vpc_id             = var.vpc_id
  public_subnet_id   = var.public_subnet_id
  private_subnet_ids = var.private_subnet_ids
  db_username        = var.db_username
}