module "network" {
  source   = "./modules/network"
  vpc_cidr = var.vpc_cidr

}

module "compute" {
  source        = "./modules/compute"
  project_name  = var.project_name
  instance_type = var.instance_type

  subnet_id         = module.network.subnet_id["public_1"]
  security_group_id = module.network.security_group_id

}
