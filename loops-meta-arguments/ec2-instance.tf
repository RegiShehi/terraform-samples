# Get list of AZs in a specific region
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# Check if respective instance type is supported in specific regions
data "aws_ec2_instance_type_offerings" "my_instance_type" {
  for_each = toset(data.aws_availability_zones.my_azones.names)

  filter {
    name   = "instance-type"
    values = ["t2.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}

resource "aws_instance" "myEC2" {
  ami           = data.aws_ami.amzLinux2.id
  instance_type = var.instance_type
  user_data     = file("${path.module}/scripts/app-install.sh")
  key_name      = var.instance_key_pair
  vpc_security_group_ids = [
    aws_security_group.vpc-ssh.id,
    aws_security_group.vpc-web.id
  ]
  # Create an EC2 Instance in all AZs of current VPC
  for_each = toset(keys({
    for az, details in data.aws_ec2_instance_type_offerings.my_instance_type :
    az => details.instance_types if length(details.instance_types) != 0
  }))
  availability_zone = each.key
  tags = {
    Name = "EC2 Demo ${each.key}"
  }
}
