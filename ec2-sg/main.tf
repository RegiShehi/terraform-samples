# Terraform block
terraform {
  required_version = "~> 1.6.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }

  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }
  }
}

# Provider block
provider "aws" {
  profile = "regi"
  region  = var.aws_region
}
