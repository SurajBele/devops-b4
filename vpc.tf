resource "aws_vpc" "spider_vpc" {
    cidr_block = "10.0.0.0/16"
  tags = {
    name = "myvpc"
    env = "dev"
  }
}
resource "aws_subnet" "pub_sub" {
    vpc_id = aws_vpc.spider_vpc.id
    cidr_block = "10.0.0.0/20"
    map_public_ip_on_launch = true
    tags = {
    name = "my_subnet"
    env = "dev"
  }
}
resource "aws_subnet" "pvt_sub" {
    vpc_id = aws_vpc.spider_vpc.id
    cidr_block = "10.0.1.0/20"
    map_public_ip_on_launch = true
    tags = {
    name = "my_subnet"
    env = "dev"
  }
}
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.spider_vpc.id
}
resource "aws_route_table" "myroutetable" {
  vpc_id = aws_vpc.example.id
  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.example.id
  }
}

resource "aws_route_table_association" "route-subnet" {
  subnet_id      = aws_subnet.pub_sub.id
  route_table_id = aws_route_table.myroutetable.id
}