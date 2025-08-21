# Assignment/EKS-Cluster/variables.tf
variable "cluster_name" {}
variable "node_group_name" {}
variable "instance_type" {}
variable "desired_size" {}
variable "min_size" {}
variable "max_size" {}
variable "ami_type" {}
variable "key_name" {}

# Networking
variable "vpc_id" {}
variable "public_subnet_ids" { type = list(string) }
variable "private_subnet_ids" { type = list(string) }
variable "security_group_id" {}
