resource "aws_db_instance" "rds-mysql" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name               = var.db_name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = true
  publicly_accessible  = false
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.rds-subnet-group.name
  delete_automated_backups = true
  deletion_protection = false
  multi_az = true
  storage_encrypted = true
}

resource "aws_db_subnet_group" "rds-subnet-group" {
  name = "rds-subnet-group"

  subnet_ids = var.db_subnet_ids

  tags = {
    Name = "RDS Subnet Group"
  }
}