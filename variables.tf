# General deployment variables

variable "aws_region" {
  type        = string
  default     = "cn-north-1"
  description = "AWS region"
}

variable "aws_profile" {
  type        = string
  default     = "automation_dev"
  description = "AWS profile which is used for the deployment"
}
