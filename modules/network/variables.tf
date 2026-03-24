variable "vpc_cidr" {
  description = "select vpc cidr"
  type        = string
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
