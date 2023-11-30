variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "Environment variable used as a prefix"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "s3_tags" {
  description = "Bucket tags"
  type        = map(string)
  default     = {}
}
