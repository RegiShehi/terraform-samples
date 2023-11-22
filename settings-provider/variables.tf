variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "instance_key_pair" {
  description = "EC2 Key Pair"
  type        = string
  default     = "test"
}

# variable "instance_type_list" {
#   description = "EC2 Instance Type"
#   type        = list(string)
#   default     = ["t2.micro", "t2.small"]
# }

# variable "instance_type_map" {
#   description = "EC2 Instance Type"
#   type        = map(string)
#   default = {
#     "dev"  = "t2.micro"
#     "qa"   = "t2.small"
#     "prod" = "t2.large"
#   }
# }
