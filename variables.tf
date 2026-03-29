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

variable "number_of_instance" {
  description = "set the number of instance one want to create"
  type        = number

  validation {
    condition     = var.number_of_instance > 0 && var.number_of_instance <= 10
    error_message = "please choose a number between 1 and 10"
  }
}

variable "ingress_rules" {
  description = "Ingress port to use in security group"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}

variable "egress_rules" {
  description = "Ingress port to use in security group"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}

