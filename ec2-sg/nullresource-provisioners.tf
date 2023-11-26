# Create a Null resource and Provisioners
resource "null_resource" "name" {
  depends_on = [module.ec2_public]

  # Connection block for provisioners to connect to EC2 Instance
  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = ""
    host        = aws_eip.bastion_eip.public_ip
    private_key = file("${path.module}/private-key/test.pem")
  }

  # File provisioner: Copies test.pem file to /tmp/test.pem
  provisioner "file" {
    source      = "${path.module}/private-key/test.pem"
    destination = "/tmp/test.pem"
  }

  # Remote Exec provisioner: Using remote exec provisioner fix the private key permissions 
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/test.pem",
    ]
  }

  # Local Exec provisioner: Local exec provisioner (create-time provisioner)
  provisioner "local-exec" {
    command     = "echo VPC created on `date` with ID: ${module.vpc.vpc_id} >> vpc-creation-time.txt"
    working_dir = "local-exec-output/"
    # on_failure  = continue
  }
}
