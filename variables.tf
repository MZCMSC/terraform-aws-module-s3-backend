# Terraform AWS Module S3
################################
# Variable
################################
variable "region" {
    description = "AWS Region"
    type = string
    default = ""
}

variable "s3_bucket" {
    description = "S3 bucket for terraform-state-backend "
    type = string
    default = ""
}

variable "s3_acl" {
    description = "S3 bucket for terraform-state-backend ACL"
    type = string
    default = ""
}

variable "dynamodb_table" {
    description = "DynamoDB table for terraform-state-backend "
    type = string
    default = ""
}

variable "tags" {
    description = "tag map"
    type = map(string)
}