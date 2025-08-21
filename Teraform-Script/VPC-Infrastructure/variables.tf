# Assignment/VPC-Infrastructure/variables.tf
variable "vpc_cidr" { type = string }

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "vpc_name" { type = string }

variable "public_subnet_names" {
  type = list(string)
}

variable "private_subnet_names" {
  type = list(string)
}

variable "igw_name" { type = string }

variable "nat_gateway_name" { type = string }

variable "security_group_name" { type = string }
