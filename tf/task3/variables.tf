variable "aws_region" {
  type    = string
  default = "ap-south-2"
  validation {
    condition     = contains(["ap-south-1", "ap-south-2"], var.aws_region)
    error_message = "Only Indian regions are allowed. Please choose a different region."
  }
}
#### Network Variables ####
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
  default = ["49.47.216.237/32"]
}

#### EC2 Variables ####
variable "ami_id" {
  type    = string
  default = "ami-08ba72c10f98c925f"
}
variable "key_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

#### DB Variables ####
variable "db_password" {
  type      = string
  sensitive = true
}