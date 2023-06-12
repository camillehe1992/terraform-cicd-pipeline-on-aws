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

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "hello-world-tf"
  description   = "My awesome lambda function deployed by Terrafrom"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"

  source_path = "../src/hello-world"
  environment_variables = {
    AWS_REGION = "cn-north-1"
  }
  tags = {
    Name = "hello-world"
  }
}
