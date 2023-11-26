# Public security group outputs
output "public_security_group_id" {
  description = "ID of public security group"
  value       = module.public_security_group.security_group_id
}

output "public_security_group_vpc_id" {
  description = "VPC ID of public security group"
  value       = module.public_security_group.security_group_vpc_id
}

output "public_security_group_name" {
  description = "Name of public security group"
  value       = module.public_security_group.security_group_name
}

# Private security group outputs
output "private_security_group_id" {
  description = "ID of private security group"
  value       = module.private_security_group.security_group_id
}

output "private_security_group_vpc_id" {
  description = "VPC ID of public security group"
  value       = module.private_security_group.security_group_vpc_id
}

output "private_security_group_name" {
  description = "Name of public private group"
  value       = module.private_security_group.security_group_name
}

