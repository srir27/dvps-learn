resource "aws_vpc" "vpc-main" {

  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  lifecycle {
    prevent_destroy   = false
    ignore_changes    = all
  }

  tags = {
    Name = "vpc-1"
    owner = "sri"
    deployment = "terraform"
  }
  
}

resource "aws_subnet" "subnets" {
  depends_on = [aws_vpc.vpc-main]
  for_each = var.subnets
  vpc_id            = aws_vpc.vpc-main.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    name = each.key
    owner = "sri"
    deployment = "terraform"
  }
}
