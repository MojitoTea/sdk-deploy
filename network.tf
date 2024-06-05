module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs              = var.vpc_azs
  public_subnets   = var.vpc_public_subnets
  private_subnets  = var.vpc_private_subnets
  database_subnets = var.vpc_database_subnets


  create_database_subnet_group       = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  enable_nat_gateway                 = true
  single_nat_gateway                 = true

  tags = var.vpc_tags
}
