variable "region" {
   default = "ap-south-1"
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
   default = "ap-south-1a"
}
variable "ami_id" {
  default = "ami-00bb6a80f01f03502"
}

variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
   default = "key.pem"
}
variable "sgid" {
  default = "sg-02608d1f30ba4fe58"
}