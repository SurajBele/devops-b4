output "aws_instance" {
  value = aws_instance.myec2.public_ip
}

output "aws_vpc" {
  value = aws_vpc.spider_vpc.id
}
output "mysg_id" {
  value = data.aws_security_groups.mysg.id
}