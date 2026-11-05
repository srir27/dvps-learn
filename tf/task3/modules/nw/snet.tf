resource "aws_subnet" "snet-ec2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet1_cidr
  map_public_ip_on_launch = true
  availability_zone = var.az1

  tags = {
    Name = "EC2 Subnet AZ1"
  }
}

resource "aws_subnet" "snet-db1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet2_cidr
  availability_zone = var.az1

  tags = {
    Name = "RDS Subnet AZ1"
  }
}

resource "aws_subnet" "snet-db2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet3_cidr
  availability_zone = var.az2

  tags = {
    Name = "RDS Subnet AZ2"
  }
}

