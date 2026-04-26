output "bucket_id" {
  description = "Name of the s3 bucker use to store Terraform state"
  value       = aws_s3_bucket.my_first_bucket.id
}

output "aws_dynamodb_table_id" {
  description = "Name of the Dynamodb table used for state locking"
  value       = aws_dynamodb_table.terraform_lock.id
}

output "region" {
  description = "AWS region where the S3 bucket is deployed"
  value       = data.aws_region.current.name
}

output "bucket_arn" {
  description = "s3 bucket arn"
  value       = aws_s3_bucket.my_first_bucket.arn
}
