terraform {
  backend "s3" {
    bucket  = "hyc-tf-state-756143471679-cn-north-1"
    key     = "cicd-pipeline-on-aws/state.json"
    region  = "cn-north-1"
    profile = "app_deployment_dev"
  }

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
