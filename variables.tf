variable "aws_region" {
  description = "Deployment region for AWS"
  type        = string
  default     = "eu-west-3"
}

variable "project_name" {
  type    = string
  default = "formation-terraform"
}
