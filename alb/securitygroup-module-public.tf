module "public_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "Public security group"
  description = "Security group with SSH port open"
  vpc_id      = module.vpc.vpc_id

  #   Ingress rules and CIDR Blocks
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  #   Egress rules = all open
  egress_rules = ["all-all"]

  tags = local.common_tags
}
