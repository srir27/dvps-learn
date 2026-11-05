variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "subnet2_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "subnet3_cidr" {
  type    = string
  default = "10.0.3.0/24"
}

variable "az1" {
  type    = string
  default = "ap-south-2a"
}

variable "az2" {
  type    = string
  default = "ap-south-2b"
}

variable "allowed_ssh_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}