module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = var.vpc_cidr

  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

}

module "security_groups" {
  source = "./modules/security-groups"

  project_name = var.project_name
  environment  = var.environment

  vpc_id   = module.vpc.vpc_id
  app_port = var.app_port
}

module "alb" {
  source = "./modules/alb"

  project_name          = var.project_name
  environment           = var.environment
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  alb_security_group_id = module.security_groups.alb_security_group_id
  app_port              = var.app_port
  health_check_path     = var.health_check_path
}

module "application" {
  source = "./modules/application"

  project_name = var.project_name
  environment  = var.environment

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids

  ami_id = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  application_security_group_id = module.security_groups.application_security_group_id

  target_group_arn = module.alb.target_group_arn

  app_port = var.app_port

  min_size = var.min_size

  max_size = var.max_size

}