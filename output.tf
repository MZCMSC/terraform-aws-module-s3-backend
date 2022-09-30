# Terraform AWS Module S3
################################
# Output
################################
output "region" {
    description = "AWS Region"
    value = var.region
}

output "s3_bucket_name" {
    description = "AWS S3 Bucket Name"
    value = aws_s3_bucket.this.bucket
}

output "dynamodb_table" {
    description = "AWS DynamoDB Table Name"
    value = aws_dynamodb_table.this.name
}

output "kms_key" {
    description = "AWS KMS KEY"
    value = aws_kms_key.this.arn
}

output "s3_bucket_acl" {
  value = aws_s3_bucket_acl.this.acl
}

output "s3_versioning" {
  value = aws_s3_bucket_versioning.this.versioning_configuration
}

output "s3_server_side_encryption_configuration" {
  value = aws_s3_bucket_server_side_encryption_configuration.this.rule
}