output "ec2_instance_id" {
  description = "id of the ec2 instance"
  value       = aws_instance.test.id
}

output "ec2_instance_ip" {
  description = "ec2 instance's private ip"
  value       = aws_instance.test.private_ip
}

output "vpc_id" {
  description = "vpc's id"
  value       = aws_vpc.test_vpc.id
}
