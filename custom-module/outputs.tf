output "arn" {
  description = "ARN of S3 Bucket"
  value       = aws_s3_bucket.my-static-website.arn
}

output "name" {
  description = "Name (id) of S3 Bucket"
  value       = aws_s3_bucket.my-static-website.id
}

output "domain" {
  description = "Domain Name of S3 Bucket"
  value       = aws_s3_bucket_website_configuration.my-static-website.website_domain
}

output "endpoint" {
  description = "Endpoint of S3 Bucket"
  value       = aws_s3_bucket_website_configuration.my-static-website.website_endpoint
}


