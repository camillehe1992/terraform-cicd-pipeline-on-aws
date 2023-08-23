terraform {
  backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# A simple SNS topic resources 
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic
resource "aws_sns_topic" "user_updates" {
  name              = "${var.environment}-user-updates-topic"
  kms_master_key_id = "alias/aws/sns"
}
