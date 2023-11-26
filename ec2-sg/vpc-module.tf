data "aws_availability_zones" "available" {}

# Create VPC terraform module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.2.0"

  # VPC Basic Details
  name            = local.name
  cidr            = local.vpc_cidr
  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 4)]

  # Database subnets
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 8)]

  # NAT Gateways for Outbound Communications
  enable_nat_gateway = true
  single_nat_gateway = true

  #   VPC DNS Parameters
  default_vpc_enable_dns_hostnames = true
  default_vpc_enable_dns_support   = true

  #   Tags
  public_subnet_tags = {
    Type = "public-subnet"
  }

  private_subnet_tags = {
    Type = "private-subnet"
  }

  database_subnet_tags = {
    Type = "database-subnet"
  }

  tags     = local.common_tags
  vpc_tags = local.common_tags
}
