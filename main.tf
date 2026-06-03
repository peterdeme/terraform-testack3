terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Glue catalog database (required by crawler)
resource "aws_glue_catalog_database" "example" {
  name = "example-db"
}

# IAM role the crawler assumes. Must live in this account; Glue rejects
# passing a role from another account (Cross-account pass role is not allowed).
resource "aws_iam_role" "glue_crawler" {
  name = "example-glue-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "glue.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "glue_service" {
  role       = aws_iam_role.glue_crawler.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

# Glue crawler with cron(...) schedule
resource "aws_glue_crawler" "example" {
  database_name = aws_glue_catalog_database.example.name
  name          = "example-crawler"
  role          = aws_iam_role.glue_crawler.arn
  schedule      = "cron(0 0/1 * * ? *)"
  description   = "cron(0 0/1 * * ? *)"

  s3_target {
    path = "s3://example-bucket"
  }
}

# Glue trigger with cron(...) schedule
resource "aws_glue_trigger" "example" {
  name     = "example-trigger"
  schedule = "cron(30 00 ? * MON-SAT *)"
  type     = "SCHEDULED"

  actions {
    job_name = "example-job"
  }
}

resource "terraform_data" "repro" {
  input = "\\u0000"
}
