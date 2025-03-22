module "vpc_module" {
  source            = "./modules/vpc"
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone
}

module "sg_module" {
  source        = "./modules/sg"
  vpc_id        = module.vpc_module.vpc_id
  sg_cidr_block = var.sg_cidr_block
}

module "ec2_module" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  pub_sg        = module.sg_module.pub_sg
  pub_sn        = module.vpc_module.sub_id
}