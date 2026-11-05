output "ec2_snet_id" {
  value = aws_subnet.snet-ec2.id
}

output "db_snet1_id" {
  value = aws_subnet.snet-db1.id
}

output "db_snet2_id" {
  value = aws_subnet.snet-db2.id
}

output "igw_id" {
  value = aws_internet_gateway.igw1.id
}

output "sg1_id" {
  value = aws_security_group.sg1.id
}

output "sg2_id" {
  value = aws_security_group.sg2.id
}