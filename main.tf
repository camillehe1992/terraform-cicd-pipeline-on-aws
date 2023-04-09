terraform {
  backend "s3" {
    bucket = "rf-state-lock-824709318323-ap-southeast-1"
    key    = "terraform/state/cicd-pipeline-on-aws.json"
    dynamodb_table = "tf-state-lock-dynamo"
    region = "ap-southeast-1"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.62.0"
    }
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"
}