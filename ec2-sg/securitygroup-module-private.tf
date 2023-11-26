module "private_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "public-security-group"
  description = "Security group with HTTP & SSH port open for entire VCP block"
  vpc_id      = module.vpc.vpc_id

  #   Ingress rules and CIDR Blocks
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  #   Egress rules = all open
  egress_rules = ["all-all"]

  tags = local.common_tags
}
