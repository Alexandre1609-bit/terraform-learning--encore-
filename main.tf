module "ec2_instance" {
  source = "./modules/ec2_instance"

  project_name = var.project_name

  instance_type     = var.instance_type
  vpc_cidr          = var.vpc_cidr
  subnet_cidr_block = var.subnet_cidr_block
}
