
output "ec2_instance_id" {
  description = "id of the ec2 instance"
  value       = module.ec2_instance.ec2_instance_id
}

output "ec2_instance_ip" {
  description = "ec2 instance's private ip"
  value       = module.ec2_instance.ec2_instance_ip
  sensitive   = true
}

output "vpc_id" {
  description = "vpc's id"
  value       = module.ec2_instance.vpc_id
}
