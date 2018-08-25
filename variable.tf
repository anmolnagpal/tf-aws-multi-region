
variable "region" {}

variable "servers_per_az" {
  default = 1
}

variable "instance_type" {
  default = "t2.nano"
}
