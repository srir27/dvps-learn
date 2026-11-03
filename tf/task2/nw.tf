resource "aws_vpc" "vpc-main" {

  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = merge(local.common_tags,
    {
      Name = var.vpc_name
  })
}

resource "aws_subnet" "subnets" {
  for_each          = var.subnets
  vpc_id            = aws_vpc.vpc-main.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = merge(local.common_tags,
    {
      Name = each.key
  })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-main.id

  tags = merge(local.common_tags,
    {
      Name = var.igw_name
  })

}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc-main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(local.common_tags,
    {
      Name = var.rt_name
  })
}

resource "aws_route_table_association" "snet-rt" {
  for_each       = aws_subnet.subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

