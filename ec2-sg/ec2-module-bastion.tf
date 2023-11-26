module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  name                   = "bastion-host-${local.environment}"
  ami                    = data.aws_ami.amzLinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_key_pair
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_security_group.security_group_id]

  tags = local.common_tags
}
