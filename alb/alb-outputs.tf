output "id" {
  description = "The ID and ARN of the load balancer we created"
  value       = aws_lb.alb.id
}

output "arn" {
  description = "The ID and ARN of the load balancer we created"
  value       = aws_lb.alb.arn
}

output "arn_suffix" {
  description = "ARN suffix of our load balancer - can be used with CloudWatch"
  value       = aws_lb.alb.arn_suffix
}

output "dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.alb.dns_name
}

output "zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records"
  value       = aws_lb.alb.zone_id
}

output "target_groups" {
  description = "Target group name"
  value       = aws_lb_target_group.target_group.name
}
