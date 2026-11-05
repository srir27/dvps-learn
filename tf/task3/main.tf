module "network" {
  source = "./modules/nw"

  vpc_cidr         = var.vpc_cidr
  allowed_ssh_cidr = var.allowed_ssh_cidr
  az1              = var.az1
  az2              = var.az2
  subnet1_cidr     = var.subnet1_cidr
  subnet2_cidr     = var.subnet2_cidr
  subnet3_cidr     = var.subnet3_cidr

}

module "ec2" {
  source = "./modules/ec2"

  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = module.network.ec2_snet_id
  security_group_ids = [module.network.sg1_id]
  key_name           = var.key_name
}

module "db" {
  source = "./modules/db"

  db_subnet_ids = [
    module.network.db_snet1_id,
    module.network.db_snet2_id
  ]

  security_group_id = module.network.sg2_id
  password          = var.db_password
}