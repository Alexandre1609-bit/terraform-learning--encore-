output "vpc_id" {
  description = "vpc's id"
  value       = aws_vpc.test_vpc.id
}

output "subnet_id" {
  description = "subnet id"
  value       = aws_subnet.subnet.id
}

output "security_group_id" {
  description = "get security group id"
  value       = aws_security_group.sec_group.id
}
