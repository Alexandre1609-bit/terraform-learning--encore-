output "vpc_id" {
  description = "vpc's id"
  value       = aws_vpc.test_vpc.id
}

output "subnet_id" {
  description = "subnet id"
  value       = { for k, v in aws_subnet.subnet : k => v.id if local.subnet_config[k].type == "public" }
}

output "security_group_id" {
  description = "get security group id"
  value       = aws_security_group.sec_group.id
}
