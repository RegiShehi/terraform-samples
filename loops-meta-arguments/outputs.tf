# Basic output: All AZs mapped to supported instance types
output "output_v1_1" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_instance_type : az => details.instance_types
  }
}

# Filtered output: Exclude unsupported AZs
output "output_v1_2" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_instance_type :
    az => details.instance_types if length(details.instance_types) != 0
  }
}

# Filtered output: Return list of AZs supported for an instance type
output "output_v1_3" {
  value = keys({
    for az, details in data.aws_ec2_instance_type_offerings.my_instance_type :
    az => details.instance_types if length(details.instance_types) != 0
  })
}
