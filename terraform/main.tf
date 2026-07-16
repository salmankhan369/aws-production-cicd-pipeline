 terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "tf_state_storage" {
  bucket        = "my-custom-prod-k8s-tf-state" # <-- Apna koi unique naam rakh lena
  force_destroy = true
}

resource "aws_dynamodb_table" "tf_state_locks" {
  name         = "k8s-workflow-state-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}