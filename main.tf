# terraform {
#   backend "s3" {
#     bucket = "devopb4"
#     key = "module_terrafrom.tfstate"
#     region = "us-east-1"
#   }
# }
# provider "aws" {
#   region = var.region
# }

# module "my_vpc" {
#   source = "./vpc"
#   vpc_cidr = var.vpc_cidr
#   project = var.project
#   subnet_cidr = var.subnet_cidr
#   az1 = var.az1
# }

# module "my_instance"{
#     source = "./instance"
#     ami_id = var.ami_id
#     instance_type = var.instance_type
#     key_name = var.key_name
#     sgid = var.sgid
#     subnet_id = module.my_vpc.my_subnet.id

# }