data "aws_region" "current" {}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "test_ami"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "172.10.0.0/28"
}

resource "aws_vpc_ipam_pool" "ipam_test" {
  address_family = "ipv4"
  ipam_scope_id  = aws_instance.test.id
  locale         = data.aws_region.current.region
}

resource "aws_vpc_ipam_pool_cidr" "test_cidr" {
  ipam_pool_id = aws_vpc_ipam_pool.ipam_test.id
  cidr         = "172.10.0.0/16"
}

resource "aws_vpc" "test_vpc" {
  cidr_block          = "172.10.0.0/28"
  ipv4_netmask_length = 24
  depends_on          = [aws_vpc_ipam_pool_cidr.test_cidr]
}

resource "aws_instance" "test" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t3.micro"
  subnet_id       = aws_subnet.subnet.id
  security_groups = [aws_security_group.allow_http]


  tags = {
    Name = "HelloWorld"

  }
}

resource "aws_security_group" "allow_http" {
  name        = "allow_htpp"
  description = "Allow http inbound and outbound traffic"
  vpc_id      = aws_vpc.test_vpc.id

  tags = {
    Name = "allow_http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.allow_http.id
  cidr_ipv4         = ".0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_http.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
