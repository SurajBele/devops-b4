output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
output "pub_subnet" {
  value = aws_subnet.pub_subnet.id
}