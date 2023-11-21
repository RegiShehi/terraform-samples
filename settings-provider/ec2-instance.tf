resource "aws_instance" "myEC2" {
  ami           = "ami-013d358a2bc9c176d"
  instance_type = "t2.micro"
  user_data     = file("${path.module}/scripts/app-install.sh")
  tags = {
    Name = "EC2 Demo"
  }
}
