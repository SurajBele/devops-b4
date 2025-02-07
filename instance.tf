
provider "aws" {
  region = "us-east-1" 
}
resource "aws_instance" "myec2" {
  ami = "ami-01816d07b1128cd2d"
  key_name = "id_rsa"
  instance_type =  "t2.micro"
  vpc_security_group_ids = [ "mysg" ]
  tags = {
    Name = "spiderman instance"
  }
}


# provider "aws" {
#   region = "us-east-1" 
# }
# resource "aws_instance" "myec2" {
#   ami = "ami-01816d07b1128cd2d"
#   key_name = "id_rsa"
#   instance_type =  "t2.micro"
#   security_groups = [ "mysg" ]
#   subnet_id = aws_subnet.pub_sub.id
#   tags = {
#     Name = "spiderman instance"
#   }
# }

