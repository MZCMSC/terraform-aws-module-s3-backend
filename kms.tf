# Terraform AWS Module S3
################################
# KMS
################################
resource "aws_kms_key" "this" {
    description = "AWS KMS for Terraform-satate-backend S3 Bucket"
    deletion_window_in_days = 10 
}
