resource "aws_vpc" "test_vpc" {
  cidr_block = var.vpc_cidr
}


resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = var.subnet_cidr_block
}

resource "aws_internet_gateway" "vpc_internet_gateway" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "Ec2_vpc_int_gtw"
  }
}

resource "aws_route_table" "ec1_route_table" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "ec2_route_table"
  }
}

resource "aws_route" "iGW" {
  route_table_id         = aws_route_table.ec1_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc_internet_gateway.id

}

resource "aws_route_table_association" "assoc" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.ec1_route_table.id
}
