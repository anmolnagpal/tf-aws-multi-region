##__     __     _      ____    ___      _      ____    _       _____   ____
##\ \   / /    / \    |  _ \  |_ _|    / \    | __ )  | |     | ____| / ___|
###\ \ / /    / _ \   | |_) |  | |    / _ \   |  _ \  | |     |  _|   \___ \
####\ V /    / ___ \  |  _ <   | |   / ___ \  | |_) | | |___  | |___   ___) |
#####\_/    /_/   \_\ |_| \_\ |___| /_/   \_\ |____/  |_____| |_____| |____/

variable "region" {
  default     = "us-west-2"
  description = "Region where you want to host"
}

variable "tags" {
  type = "map"

  default = {
    env       = "stage"
    app       = "test"
    managedby = "Terraform"
  }

  description = "Terraform Tags"
}

variable "key" {
  default     = "it-admin-key"
  description = "SSH Key name"
}

variable "cidr_block" {
  default     = "10.0.0.0/8"
  description = "IP range"
}
