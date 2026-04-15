variable "instance_type" {
  description = "Select instance type"
  type        = string
}

variable "project_name" {
  description = "project's name"
  type        = string
}

variable "subnet_id" {
  description = "Get subenet id from network module"
  type        = string
}

variable "security_group_id" {
  description = "get security group id from network module"
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

variable "iam_instance_profile" {
  type = string
}
