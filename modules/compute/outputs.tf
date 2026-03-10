output "ec2_instance_id" {
  description = "id of the ec2 instance"
  value       = aws_instance.test.id
}


output "ec2_instance_private_ip" {
  description = "ec2 instance's private ip"
  value       = aws_instance.test.private_ip
  sensitive   = true
}
