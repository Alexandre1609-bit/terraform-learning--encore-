
locals {
  subnet_config = {
    "public_1"  = { cidr = "172.10.0.0/26", type = "public", az = "eu-west-3a" }
    "public_2"  = { cidr = "172.10.0.64/26", type = "public", az = "eu-west-3b" }
    "private_1" = { cidr = "172.10.0.128/26", type = "private", az = "eu-west-3a" }
    "private_2" = { cidr = "172.10.0.192/26", type = "private", az = "eu-west-3b" }
  }
}


resource "aws_vpc" "test_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = "first_vpc"
    Environment = "dev"
    Owner       = "alexandre"
  }

}

resource "aws_subnet" "subnet" {
  for_each = local.subnet_config

  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name        = each.key
    Environment = "dev"
    Owner       = "alexandre"
  }
}

resource "aws_internet_gateway" "vpc_internet_gateway" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name        = "Ec2_vpc_int_gtw"
    Environment = "dev"
    Owner       = "alexandre"
  }
}

resource "aws_route_table" "ec1_route_table" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name        = "ec2_route_table"
    Environment = "dev"
    Owner       = "alexandre"
  }
}

resource "aws_route" "IGW" {
  route_table_id         = aws_route_table.ec1_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc_internet_gateway.id

}

resource "aws_route_table_association" "assoc" {
  for_each       = { for k, v in local.subnet_config : k => v if v.type == "public" }
  subnet_id      = aws_subnet.subnet[each.key].id
  route_table_id = aws_route_table.ec1_route_table.id

}

