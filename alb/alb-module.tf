# Create Target Group for EC2 instances
resource "aws_lb_target_group" "test" {
  name = "test"
  # name_prefix = "app-1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

# Attach EC2 instances to the Target Group
resource "aws_lb_target_group_attachment" "attachment" {
  for_each = module.ec2_private

  target_group_arn = aws_lb_target_group.test.arn
  target_id        = each.value.id
  port             = 80
}

module "alb" {
  source     = "terraform-aws-modules/alb/aws"
  version    = "9.2.0"
  depends_on = [aws_lb_target_group.test]

  name                       = "my-alb-${local.environment}"
  load_balancer_type         = "application"
  vpc_id                     = module.vpc.vpc_id
  subnets                    = module.vpc.public_subnets
  security_groups            = [module.load_balancer_security_group.security_group_id]
  enable_deletion_protection = false

  #   Listeners
  listeners = {
    http-tcp-listener = {
      port     = 80
      protocol = "HTTP"
      forward = {
        target_group_key = aws_lb_target_group.test.arn
      }
    }
  }

  tags = local.common_tags
}
