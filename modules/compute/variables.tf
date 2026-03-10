variable "instance_type" {
  description = "Select instance type"
  type        = string
}

variable "project_name" {
  description = "project's name"
  type        = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}
