output "instance_public_ip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.myEC2.public_ip
}

output "instance_public_dns" {
  description = "EC2 Instance Public DNS"
  value       = aws_instance.myEC2.public_dns
}