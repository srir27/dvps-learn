output "db_endpoint" {
  value = aws_db_instance.rds-mysql.endpoint
}
output "db_port" {
  value = aws_db_instance.rds-mysql.port
}
output "db_name" {
  value = aws_db_instance.rds-mysql.db_name
}
output "db_username" {
  value = aws_db_instance.rds-mysql.username
}