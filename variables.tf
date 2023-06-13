# General deployment variables

variable "aws_region" {
  type        = string
  default     = "cn-north-1"
  description = "AWS region"
}

variable "aws_profile" {
  type        = string
  default     = "756143471679_UserFull"
  description = "AWS profile which is used for the deployment"
}
