resource "aws_vpc" "demo_vpc" {
  cidr_block = var.cidr_block[0]
  tags = {
    Name = "demo_vpc"
  }
}

resource "aws_internet_gateway" "demo_igw" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "demo_igw"
  }
}

resource "aws_subnet" "pub_sn1" {
  vpc_id = aws_vpc.demo_vpc.id
  cidr_block = var.cidr_block[1]
  availability_zone = var.availability_zone[0]
  tags = {
    Name = "pub_sn1"
  }
}

resource "aws_subnet" "priv_sn1" {
  vpc_id = aws_vpc.demo_vpc.id
  cidr_block = var.cidr_block[2]
  availability_zone = var.availability_zone[1]
  tags = {
    Name = "priv-sn1"
  }
}

resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "pub_rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "priv_rt"
  }
}

resource "aws_route" "public_route" {
    route_table_id =   aws_route_table.pub_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id
}

resource "aws_route_table_association" "pub_sn1_association" {
  subnet_id = aws_subnet.pub_sn1.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pri_sn1_association" {
  subnet_id = aws_subnet.priv_sn1.id
  route_table_id = aws_route_table.private_rt.id
}
