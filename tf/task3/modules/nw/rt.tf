resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
  }
}

resource "aws_route_table" "rt2" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.snet-ec2.id
  route_table_id = aws_route_table.rt1.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.snet-db1.id
  route_table_id = aws_route_table.rt2.id
}

resource "aws_route_table_association" "rta3" {
  subnet_id      = aws_subnet.snet-db2.id
  route_table_id = aws_route_table.rt2.id
}