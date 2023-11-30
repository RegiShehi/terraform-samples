output "arn" {
  description = "Website bucket ARN"
  value       = module.website_s3_bucket.arn
}

output "name" {
  description = "Website bucket name"
  value       = module.website_s3_bucket.name
}

output "domain" {
  description = "Website bucket domain name"
  value       = module.website_s3_bucket.domain
}

output "endpoint" {
  description = "Website bucket endpoint"
  value       = module.website_s3_bucket.endpoint
}


