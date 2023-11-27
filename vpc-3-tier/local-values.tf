locals {
  vpc_cidr    = "10.0.0.0/16"
  azs         = slice(data.aws_availability_zones.available.names, 0, 2)
  environment = var.environment
  name        = "vpc-${local.environment}"
  common_tags = {
    Environment = local.environment
  }
}
