module "network" {
  source        = "./modules/network"
  vpc_cidr      = var.vpc_cidr
  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules

}

module "compute" {
  source             = "./modules/compute"
  number_of_instance = var.number_of_instance
  project_name       = var.project_name
  instance_type      = var.instance_type

  subnet_id            = module.network.subnet_id["public_1"]
  security_group_id    = module.network.security_group_id
  iam_instance_profile = module.iam_policies.instance_profil_name

}

module "iam_policies" {
  source = "./modules/iam_policies"
}
