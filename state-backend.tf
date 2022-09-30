# Terraform AWS Module S3
################################
# S3 Bucket
################################
resource "aws_s3_bucket" "this" {
    bucket = var.s3_bucket
    
    lifecycle {
      prevent_destroy = true
    }

    tags = merge(var.tags, tomap({Name = format("%s", var.s3_bucket)}))
}

resource "aws_s3_bucket_acl" "this" {
    bucket = aws_s3_bucket.this.id
    acl = var.s3_acl
}

resource "aws_s3_bucket_versioning" "this" {
    bucket = aws_s3_bucket.this.id
    versioning_configuration {
      status = "Enabled"
    }  
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" { 
    bucket = aws_s3_bucket.this.id
    rule {
        apply_server_side_encryption_by_default {
            kms_master_key_id = aws_kms_key.this.arn
            sse_algorithm = "aws:kms"
        }
        
        # apply_server_side_encryption_by_default {
        #     sse_algorithm = "AES256" 
        # }
    }
}

################################
# Dynamo DB Table
################################
resource "aws_dynamodb_table" "this" {
    name = var.dynamodb_table
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }

    tags = merge(var.tags, tomap({Name = format("%s", var.dynamodb_table)}))
}
