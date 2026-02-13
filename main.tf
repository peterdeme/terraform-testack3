terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "orbit_storage" {
  bucket = "fiery-capsule-stack-${data.aws_caller_identity.current.account_id}"

tags = {
  name        = "Orbit Labs Storage"
  managedBy   = "Spacelift"
  mission     = "First Launch"
  environment = "demo"
}
}

data "aws_caller_identity" "current" {}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

