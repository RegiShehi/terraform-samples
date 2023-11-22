# Availability Zones Data Source
# data "aws_availability_zones" "my_az" {
#   filter {
#     name   = "opt-in-status"
#     values = ["opt-in-not-required"]
#   }
# }

resource "aws_instance" "myEC2" {
  ami           = data.aws_ami.amzLinux2.id
  instance_type = var.instance_type
  # Create EC2 instance in all available AZs for current region
  # for_each          = toset(data.data.aws_availability_zones.my_az.names)
  # availability_zone = each.key

  # instance_type = var.instance_type_list[0]
  # instance_type = var.instance_type_map["dev"]
  # Create two identical EC2 instances
  # count     = 2
  user_data = file("${path.module}/scripts/app-install.sh")
  key_name  = var.instance_key_pair
  vpc_security_group_ids = [
    aws_security_group.vpc-ssh.id,
    aws_security_group.vpc-web.id
  ]
  tags = {
    Name = "EC2 Demo"
    # Name = "EC2 Demo ${count.index}"
    # Name = "EC2 Demo ${each.key}"
  }
}
