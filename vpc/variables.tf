##__     __     _      ____    ___      _      ____    _       _____   ____
##\ \   / /    / \    |  _ \  |_ _|    / \    | __ )  | |     | ____| / ___|
###\ \ / /    / _ \   | |_) |  | |    / _ \   |  _ \  | |     |  _|   \___ \
####\ V /    / ___ \  |  _ <   | |   / ___ \  | |_) | | |___  | |___   ___) |
#####\_/    /_/   \_\ |_| \_\ |___| /_/   \_\ |____/  |_____| |_____| |____/

variable "region" {
  description = "Region where applicatoin need to be setup"
  default     = ""

}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "key" {
  description = "The CIDR block for the VPC."
  default     = ""
}

variable "cidr_block" {
  description = "The CIDR block for the VPC."
  default     = ""
}

variable "app" {
  description = "Appication name to be used on all the resources as identifier"
  default     = ""
}
