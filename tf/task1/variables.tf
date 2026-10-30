#map of objects
variable "subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}