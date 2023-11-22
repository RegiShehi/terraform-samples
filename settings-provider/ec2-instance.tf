resource "aws_instance" "myEC2" {
  ami           = data.aws_ami.amzLinux2.id
  instance_type = var.instance_type
  # instance_type = var.instance_type_list[0]
  # instance_type = var.instance_type_map["dev"]
  user_data = file("${path.module}/scripts/app-install.sh")
  key_name  = var.instance_key_pair
  # count     = 2
  vpc_security_group_ids = [
    aws_security_group.vpc-ssh.id,
    aws_security_group.vpc-web.id
  ]
  tags = {
    Name = "EC2 Demo"
    # Name = "EC2 Demo ${count.index}"
  }
}
