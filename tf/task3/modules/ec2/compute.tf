resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = var.security_group_ids
  key_name = var.key_name
  tags = {
    Name = "EC2 Instance"
  }
  
}