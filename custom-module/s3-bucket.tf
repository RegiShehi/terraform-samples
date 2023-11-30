module "website_s3_bucket" {
  source      = "./modules/s3-static-website"
  bucket_name = var.s3_bucket_name
  tags        = var.s3_tags
}
