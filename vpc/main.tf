resource "aws_vpc" "kpvpctest" {
  cidr_block = var.vpc_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "kppubsub1" {
  vpc_id = aws_vpc.kpvpctest.id
  cidr_block =var.sub_block1
  map_public_ip_on_launch = var.iplaunch
  availability_zone = var.sublocation1
  tags = {
    Name = var.sub1_name
  }
}

resource "aws_internet_gateway" "kpinternet" {
  vpc_id = aws_vpc.kpvpctest.id
  tags = {
    Name = var.ig_name
  }
}

resource "aws_default_route_table" "kpDefroute" {
  default_route_table_id =aws_vpc.kpvpctest.default_route_table_id
  route {
    cidr_block = var.everyip
    gateway_id = aws_internet_gateway.kpinternet.id
  }
  tags = {
    Name = var.route_name
  }
}

resource "aws_route_table_association" "assoc1" {
  route_table_id = aws_default_route_table.kpDefroute.id
  subnet_id = aws_subnet.kppubsub1.id
}