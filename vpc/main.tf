##____    ____     ___   __     __  ___   ____    _____   ____
#|  _ \  |  _ \   / _ \  \ \   / / |_ _| |  _ \  | ____| |  _ \
#| |_) | | |_) | | | | |  \ \ / /   | |  | | | | |  _|   | |_) |
#|  __/  |  _ <  | |_| |   \ V /    | |  | |_| | | |___  |  _ <
#|_|     |_| \_\  \___/     \_/    |___| |____/  |_____| |_| \_\
# Specify the provider and access details
provider "aws" {
  shared_credentials_file = "./credentials"
  profile                 = "live"
  region                  = "${var.region}"
}

##___    ____  __        __
#|_ _|  / ___| \ \      / /
##| |  | |  _   \ \ /\ / /
##| |  | |_| |   \ V  V /
#|___|  \____|    \_/\_/

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${merge(map("Name", format("%s", var.app)), var.tags)}"
}

###_  __  _____  __   __  ____       _      ___   ____
##| |/ / | ____| \ \ / / |  _ \     / \    |_ _| |  _ \
##| ' /  |  _|    \ V /  | |_) |   / _ \    | |  | |_) |
##| . \  | |___    | |   |  __/   / ___ \   | |  |  _ <
##|_|\_\ |_____|   |_|   |_|     /_/   \_\ |___| |_| \_\

## keypair for ec2
resource "aws_key_pair" "live-key" {
  key_name   = "${var.key}"
  public_key = "${file("./it-admin-key.pub")}"
}
