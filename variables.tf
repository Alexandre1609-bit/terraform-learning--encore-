variable "aws_region" {
  description = "Deployment region for AWS"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "instance_type" {
  description = "Select instance type"
  type        = string
}

variable "vpc_cidr" {
  description = "select vpc cidr"
  type        = string
}

