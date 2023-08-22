# General deployment variables

variable "aws_region" {
  type        = string
  default     = "cn-north-1"
  description = "AWS region"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Application Environment, such as dev, prod"
}

variable "aws_profile" {
  type        = string
  default     = "app_deployment_dev"
  description = "AWS profile which is used for the deployment"
}
