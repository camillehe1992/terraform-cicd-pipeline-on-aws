terraform {
  backend "s3" {
    bucket         = "hyc-tf-state-756143471679-cn-north-1"
    key            = "terraform/state/cicd-pipeline-on-aws.json"
    dynamodb_table = "hyc-tf-state-756143471679-cn-north-1"
    region         = "cn-north-1"
    profile        = "756143471679_UserFull"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# A simple CloudWatch Log group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group
resource "aws_cloudwatch_log_group" "yada" {
  name = "Yada"

  tags = {
    Environment = "production"
    Application = "serviceA"
  }
}
