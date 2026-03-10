
output "ec2_instance_id" {
  description = "id of the ec2 instance"
  value       = module.compute.ec2_instance_id
}

output "ec2_instance_ip" {
  description = "ec2 instance's private ip"
  value       = module.compute.ec2_instance_private_ip
  sensitive   = true
}

output "vpc_id" {
  description = "vpc's id"
  value       = module.network.vpc_id
}
