#map of objects
variable "subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type    = string
  default = "vpc-1"
}

variable "igw_name" {
  type    = string
  default = "igw-1"
}

variable "rt_name" {
  type    = string
  default = "rt-1"
}

variable "ec2_name" {
  type    = string
  default = "ec2-1"
}

variable "ssh_allowed_cidrs" {
  type    = list(string)
  default = ["49.47.216.241/32"]
}
variable "lb_name" {
  type    = string
  default = "alb-1"
}