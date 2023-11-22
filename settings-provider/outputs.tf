output "instance_public_ip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.myEC2.public_ip
}

output "instance_public_dns" {
  description = "EC2 Instance Public DNS"
  value       = aws_instance.myEC2.public_dns
}

# # Output - For Loop with List
# output "for_output_list" {
#   description = "For Loop with List"
#   value       = [for instance in aws_aws_instance.myEC2 : instance.public_dns]
# }

# # Output - For Loop with Map
# output "for_output_map" {
#   description = "For Loop with Map"
#   value       = { for instance in aws_aws_instance.myEC2 : instance.id => instance.public_dns }
# }

# # Output - For Loop with Map Advanced
# output "for_output_map2" {
#   description = "For Loop with Map Advanced"
#   value       = { for c, instance in aws_aws_instance.myEC2 : c => instance.instance_public_dns }
# }

# # Output Generalized Splat Operator - Returns the List
# output "latest_splat_instance" {
#   description = "Generalized Splat Operator"
#   value       = aws_instance.myEC2[*].public_dns
# }

