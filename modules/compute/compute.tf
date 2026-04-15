data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  tags = {
    Name        = "ubuntu ami"
    Environment = "dev"
    Owner       = "alexandre"
  }

}
resource "aws_instance" "test" {
  count                       = var.number_of_instance
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  iam_instance_profile        = var.iam_instance_profile
  tags = {
    Name        = "${var.project_name}-${count.index}"
    Environment = "dev"
    Owner       = "alexandre"

  }

  lifecycle {
    ignore_changes        = [tags["Name"]]
    create_before_destroy = true
  }
}





