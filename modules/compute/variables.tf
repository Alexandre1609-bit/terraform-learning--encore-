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
