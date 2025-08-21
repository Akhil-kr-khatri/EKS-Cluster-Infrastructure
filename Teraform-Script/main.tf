# Assignment/main.tf
# -----------------------
# VPC values
# -----------------------
locals {
  vpc_cidr              = "10.0.0.0/16"
  public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs  = ["10.0.3.0/24", "10.0.4.0/24"]

  vpc_name              = "EKS-VPC"
  public_subnet_names   = ["EKS-PublicSubnet-1", "EKS-PublicSubnet-2"]
  private_subnet_names  = ["EKS-PrivateSubnet-1", "EKS-PrivateSubnet-2"]
  igw_name              = "Internet-Gateway"
  nat_gateway_name      = "NAT-Gateway"
  security_group_name   = "EKS-SG-OpenAll"
}

# -----------------------
# EKS values
# -----------------------
locals {
  cluster_name    = "EKS-Cluster"
  node_group_name = "EKS-NodeGroup"

  instance_type   = "t3.medium"
  desired_size    = 2
  min_size        = 2
  max_size        = 3

  ami_type        = "AL2023_x86_64_STANDARD"
  key_name        = ""
}

# -----------------------
# Modules
# -----------------------
module "vpc" {
  source = "./VPC-Infrastructure"

  vpc_cidr             = local.vpc_cidr
  public_subnet_cidrs  = local.public_subnet_cidrs
  private_subnet_cidrs = local.private_subnet_cidrs

  vpc_name             = local.vpc_name
  public_subnet_names  = local.public_subnet_names
  private_subnet_names = local.private_subnet_names
  igw_name             = local.igw_name
  nat_gateway_name     = local.nat_gateway_name
  security_group_name  = local.security_group_name
}

module "eks" {
  source = "./EKS-Cluster"

  cluster_name       = local.cluster_name
  node_group_name    = local.node_group_name
  instance_type      = local.instance_type
  desired_size       = local.desired_size
  min_size           = local.min_size
  max_size           = local.max_size
  ami_type           = local.ami_type
  key_name           = local.key_name

  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  security_group_id  = module.vpc.security_group_id
}
