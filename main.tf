## Provider
provider "aws" {
  profile = local.workspace["aws_profile"]
  region  = local.workspace["aws_region"]
}

## Locals
locals {
  env = {
    vpc-apse2-main-dev = {
      aws_profile = "dev"
      aws_region  = "ap-southeast-2"

      cidr_block = "10.0.0.0/20"
    }

    vpc-apse2-main-prod = {
      aws_profile = "prod"
      aws_region  = "ap-southeast-2"

      cidr_block = "10.1.0.0/20"
    }
  }

  workspace = local.env[terraform.workspace]
}

## Main
resource "aws_vpc" "main" {
  cidr_block = local.workspace["cidr_block"]

  tags = {
    Name = terraform.workspace
  }
}
