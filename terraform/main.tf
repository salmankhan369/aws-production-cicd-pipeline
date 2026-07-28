terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Yahan aapke main infrastructure resources rahenge (EKS/EC2/Security Groups etc.)
# S3 aur DynamoDB resources bilkul remove kar diye hain.