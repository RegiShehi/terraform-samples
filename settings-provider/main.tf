# Terraform block
terraform {
  required_version = "~> 1.6.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

# Remote backend for storing Terraform state in S3 bucket
#   backend "s3" {
#     bucket = "terraform-bucket"
#     key    = "path/to/my/key"
#     region = "eu-central-1"
#   }

# Provider block
provider "aws" {
  profile = "regi"
  region  = "eu-central-1"
}
