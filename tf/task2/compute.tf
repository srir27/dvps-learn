resource "aws_instance" "ec2" {
  for_each = aws_subnet.subnets

  ami                         = "ami-0dd60a46ecc6eac16"
  instance_type               = "t3.micro"
  subnet_id                   = each.value.id
  vpc_security_group_ids      = [aws_security_group.ec2-sg.id]
  associate_public_ip_address = true

  tags = merge(local.common_tags, {
    Name = "${var.ec2_name}-${each.key}"
  })
  key_name = "awskeypersonal"
}

