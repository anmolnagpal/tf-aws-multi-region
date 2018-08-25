
variable "region" {
  us-west-1 = "us-west-1"
  us-west-2 = "us-west-2"
}

variable "servers_per_az" {
  default = 1
}

variable "instance_type" {
  default = "t2.nano"
}
