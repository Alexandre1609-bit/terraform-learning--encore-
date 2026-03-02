variable "instance_type" {
  description = "Select instance type"
  type        = string
}

variable "subnet_cidr_block" {
  description = "select subnet cidr"
  type        = string
}

variable "vpc_cidr" {
  description = "select vpc cidr"
  type        = string
}

variable "project_name" {
  description = "project's name"
  type        = string
}
