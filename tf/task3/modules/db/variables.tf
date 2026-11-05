variable "allocated_storage" {
  type    = number
  default = 20 
}
variable "engine" {
  type    = string
  default = "mysql"
}
variable "engine_version" {
  type    = string
  default = "8.0"
}
variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}
variable "db_name" {
  type    = string
  default = "mydb"
}
variable "username" {
  type    = string
  default = "admin"
}
variable "password" {      
  type    = string
  sensitive = true
}
variable "parameter_group_name" {
  type    = string
  default = "default.mysql8.0"
}
variable "security_group_id" {
  type    = string
}
variable "db_subnet_ids" {
  type = list(string)
}