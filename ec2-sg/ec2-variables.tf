variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "instance_key_pair" {
  description = "EC2 Instance Key Pair"
  type        = string
  default     = "test"
}
