resource "aws_security_group" "sec_group" {
  name        = "sec_group"
  description = "Add security group with inbound and outbound rules"
  vpc_id      = aws_vpc.test_vpc.id

  tags = {
    Name = "Add sec_group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.sec_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sec_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

