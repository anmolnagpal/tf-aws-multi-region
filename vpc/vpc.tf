#__     __  ____     ____
#\ \   / / |  _ \   / ___|
##\ \ / /  | |_) | | |
###\ V /   |  __/  | |___
####\_/    |_|      \____|

# Create a VPC to launch our instances into
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr_block}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Application = "${var.tags["app"]}-vpc"
    Environment = "${var.tags["env"]}"
    ManagedBy   = "${var.tags["managedby"]}"
  }
}
