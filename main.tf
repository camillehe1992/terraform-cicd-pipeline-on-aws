terraform {
  backend "s3" {
    bucket         = "hyc-tf-state-281167210162-cn-north-1"
    key            = "terraform/state/cicd-pipeline-on-aws.json"
    dynamodb_table = "hyc-tf-state-281167210162-cn-north-1-table"
    region         = "cn-north-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.62.0"
    }
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"
}
