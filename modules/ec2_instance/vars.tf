variable "instance_type" {
  description = "Select instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_cidr_block" {
  description = "select subnet cidr"
  type        = string
  default     = "172.10.0.0/28"
}

variable "vpc_cidr" {
  description = "select vpc cidr"
  type        = string
  default     = "172.10.0.0/24"
}
