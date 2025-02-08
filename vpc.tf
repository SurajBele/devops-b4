# terraform {
#   backend "s3" {
#     region = "us-east-1"
#     bucket = "devopb4"
#     key = "terrafrom.tfstate"
#   }
# }
# provider "aws" {
#   region = var.region
# }
# data "aws_security_groups" "mysg" {
#   filter {
#     name   = "vpc-id"
#     values = ["vpc-0b0072d19f34389e0"]
#   }
#   filter {
#     name = "group-name"
#     values = ["mysg"]
#   }
# }
# resource "aws_instance" "myec2" {
#   ami = "ami-01816d07b1128cd2d"
#   key_name = "id_rsa"
#   instance_type =  "t2.micro"
#   vpc_security_groups =[data.aws_security_groups.mysg.id]
#   subnet_id = aws_subnet.pub_sub.id
#   tags = {
#     Name = "spiderman instance"
#   }
# }

# resource "aws_vpc" "spider_vpc" {
#     cidr_block = "10.0.0.0/16"
#   tags = {
#     name = "spider_vpc"
#     env = "dev"
#   }
# }
# resource "aws_subnet" "pub_sub" {
#     vpc_id = aws_vpc.spider_vpc.id
#     cidr_block = "10.0.0.0/24"
#     map_public_ip_on_launch = true
#     tags = {
#     name = "my_pub_subnet"
#     env = "dev"
#   }
# }
# resource "aws_subnet" "pvt_sub" {
#     vpc_id = aws_vpc.spider_vpc.id
#     cidr_block = "10.0.1.0/24"
#     map_public_ip_on_launch = false
#     tags = {
#     name = "my_pvt_subnet"
#     env = "dev"
#   }
# }
# resource "aws_internet_gateway" "myigw" {
#   vpc_id = aws_vpc.spider_vpc.id
# }
# resource "aws_route_table" "myroutetable" {
#   vpc_id = aws_vpc.spider_vpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.myigw.id
#   }
# }

# resource "aws_route_table_association" "route-subnet" {
#   subnet_id      = aws_subnet.pub_sub.id
#   route_table_id = aws_route_table.myroutetable.id
# }



