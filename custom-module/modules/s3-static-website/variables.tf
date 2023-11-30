variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "tags" {
  description = "Bucket tags"
  type        = map(string)
  default     = {}
}
