resource "aws_lb" "alb" {
  depends_on                 = [module.vpc]
  name                       = "alb-${local.environment}"
  internal                   = false
  load_balancer_type         = "application"
  subnets                    = module.vpc.public_subnets
  security_groups            = [module.load_balancer_security_group.security_group_id]
  enable_deletion_protection = false // change to true for production

  tags = local.common_tags
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

# Create Target Group for EC2 instances
resource "aws_lb_target_group" "target_group" {
  name     = "test-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

# Attach EC2 instances to the Target Group
resource "aws_lb_target_group_attachment" "target_group_attachment" {
  for_each = module.ec2_private

  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = each.value.id
  port             = 80
}
