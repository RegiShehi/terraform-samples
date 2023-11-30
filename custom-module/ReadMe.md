## Environment Variables

To run this project, you will need to add the following environment variables to your .tfvars file

```json
aws_region = eu-central-1

environment = dev

s3_bucket_name = somegloballyuniquename

s3_tags = {
    Terraform = "true"
    Environment = "dev"
}
```
