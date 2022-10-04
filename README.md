# terraform-aws-module-s3-backend

- Create by terraform module S3
- terraform.tfstat 운영에 필요한 S3 버킷 생성
- DynamoDB를 사용하여 terraform-stat-locks 테이블 생성

## Usage

#### `main.tf`

```hcl
module "terraform-state-backend" {
  source = "git::https://github.com/MZCMSC/terraform-aws-module-s3-backend.git"

    region = var.region

    s3_bucket = var.s3_bucket
    s3_acl = var.s3_acl

    dynamodb_table = var.dynamodb_table

    tags = var.tags
}
```

#### `terraform.tfvars`

```hcl
region         = "ap-northeast-2"

s3_bucket      = "test-terraform-state-backend"
s3_acl         = "private"

dynamodb_table = "test-terraform-state-locks"

tags = {
  "CreatedByTerraform" = "true",
  "purpose"            = "TEST",
  "resource"           = "S3",
  "owner"              = "YG"
}
```

#### `variabls.tf`

```hcl
variable "region" {
  type    = string
  default = ""
}

variable "s3_bucket" {
  type    = string
  default = ""
}

variable "s3_acl" {
  type    = string
  default = ""
}

variable "dynamodb_table" {
  type    = string
  default = ""
}

variable "tags" {
  type = map(string)
}
```

#### `terraform.tf`

```hcl
terraform {
  required_version = ">= 0.15.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.32.0"
    }
  }
}
```

#### `provider.tf`

```hcl
provider "aws" {
  region = var.region
}
```
