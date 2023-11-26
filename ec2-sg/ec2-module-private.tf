module "ec2_private" {
  depends_on = [module.vpc]
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "5.5.0"

  for_each = toset(["0", "1"])

  name                   = "private-vm-${each.key}-${local.environment}"
  ami                    = data.aws_ami.amzLinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_key_pair
  subnet_id              = element(module.vpc.private_subnets, tonumber(each.key))
  vpc_security_group_ids = [module.public_security_group.security_group_id]
  user_data              = file("${path.module}/scripts/app-install.sh")

  tags = local.common_tags
}
