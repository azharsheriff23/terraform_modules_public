resource "aws_vpc" "kubevpc" {
  cidr_block = var.vpc_block
  tags = {
    Name =var.vpc_name
  }
}

resource "aws_subnet" "pubsub1" {
    vpc_id = aws_vpc.kubevpc.id
    cidr_block = var.sub1
    map_public_ip_on_launch = true
    availability_zone = "us-west-2a"
    tags = {
      Name = var.sub1_name
    }
}

resource "aws_subnet" "pubsub2" {
    vpc_id = aws_vpc.kubevpc.id
    cidr_block = var.sub2
    map_public_ip_on_launch = true
    availability_zone = "us-west-2b"
    tags = {
      Name = var.sub2_name
    }
}

resource "aws_internet_gateway" "kubeigw" {
    vpc_id = aws_vpc.kubevpc.id
    tags = {
      Name = "kuigw"
    }
}

resource "aws_route_table" "kuberoute" {
    vpc_id = aws_vpc.kubevpc.id
    route {
        cidr_block = var.all_ip
        gateway_id = aws_internet_gateway.kubeigw.id
    }
  
}

resource "aws_route_table_association" "assco1" {
    route_table_id = aws_route_table.kuberoute.id
    subnet_id = aws_subnet.pubsub1.id
}

resource "aws_route_table_association" "assco2" {
    route_table_id = aws_route_table.kuberoute.id
    subnet_id = aws_subnet.pubsub2.id
}