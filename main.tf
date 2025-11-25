provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  s3_use_path_style           = false
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway = "http://localstack:4566"
    dynamodb   = "http://localstack:4566"
    iam        = "http://localstack:4566"
    kinesis    = "http://localstack:4566"
    lambda     = "http://localstack:4566"
    s3         = "http://s3.localstack.localstack.cloud:4566"
    ses        = "http://localstack:4566"
    sns        = "http://localstack:4566"
    sqs        = "http://localstack:4566"
    sts        = "http://localstack:4566"
  }
}

resource "aws_sns_topic" "user_updates" {
  name = "user-updates-topic"
}
