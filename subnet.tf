resource "aws_subnet" "public" {
  count                           = "${length(data.aws_availability_zones.available.names)}"
  vpc_id                          = "${aws_vpc.main.id}"
  cidr_block                      = "${cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)}"
  ipv6_cidr_block                 = "${cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, count.index)}"
  map_public_ip_on_launch         = true
  assign_ipv6_address_on_creation = true
  availability_zone               = "${element(data.aws_availability_zones.available.names, count.index)}"

  tags = {
    Name = "cdn-${element(data.aws_availability_zones.available.names, count.index)}-public"
  }
}

resource "aws_route_table" "public" {
  count  = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.live-internet-gateway.id}"
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = "${aws_internet_gateway.live-internet-gateway.id}"
  }
}

resource "aws_route_table_association" "public" {
  count          = "${length(data.aws_availability_zones.available.names)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.public.*.id, count.index)}"
}
