variable "region" {
   default = "us-east-1"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "project" {
  default = "module_era"
}
variable "subnet_cidr" {
  default = "10.0.0.0/20"
}
variable "az1"{
   default = "us-east-1a"
}
variable "ami_id" {
  default = "ami-04681163a08179f28"
}

variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
   default = "id_rsa"
}
variable "sgid" {
  default = "sg-0d34c3d2b6fa6492a"
}