##__  __ ___ ____   ____     ____  _   _ ____  _   _ _____ _____
#|  \/  |_ _/ ___| / ___|   / ___|| | | | __ )| \ | | ____|_   _|
#| |\/| || |\___ \| |   ____\___ \| | | |  _ \|  \| |  _|   | |
#| |  | || | ___) | |__|_____|__) | |_| | |_) | |\  | |___  | |
#|_|  |_|___|____/ \____|   |____/ \___/|____/|_| \_|_____| |_|

# Subnet VPC
variable "subnet-pub-1b" {
  default = "10.0.32.0/20"
}

# Subnets with AZ-A
resource "aws_subnet" "subnet-pub-1b" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.subnet-pub-1b}"
  availability_zone = "${var.region}b"

  tags = "${merge(map("Name", format("%s", var.app)), var.tags)}"
}

##  route table association
resource "aws_route_table" "route-table-pub-1b" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig.id}"
  }

  tags = "${merge(map("Name", format("%s", var.app)), var.tags)}"
}

# route table association Zone-A
resource "aws_route_table_association" "route-table-pub-1b" {
  subnet_id      = "${aws_subnet.subnet-pub-1b.id}"
  route_table_id = "${aws_route_table.route-table-pub-1b.id}"
}
