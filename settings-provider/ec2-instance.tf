resource "aws_instance" "myEC2" {
  ami           = data.aws_ami.amzLinux2.id
  instance_type = var.instance_type
  user_data     = file("${path.module}/scripts/app-install.sh")
  key_name      = var.instance_key_pair
  vpc_security_group_ids = [
    aws_security_group.vpc-ssh.id,
    aws_security_group.vpc-web.id
  ]
  tags = {
    Name = "EC2 Demo"
  }
}
