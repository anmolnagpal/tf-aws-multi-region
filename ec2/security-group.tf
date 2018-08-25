##____                                 _   _                ____
#/ ___|    ___    ___   _   _   _ __  (_) | |_   _   _     / ___|  _ __    ___    _   _   _ __
#\___ \   / _ \  / __| | | | | | '__| | | | __| | | | |   | |  _  | '__|  / _ \  | | | | | '_ \
##___) | |  __/ | (__  | |_| | | |    | | | |_  | |_| |   | |_| | | |    | (_) | | |_| | | |_) |
#|____/   \___|  \___|  \__,_| |_|    |_|  \__|  \__, |    \____| |_|     \___/   \__,_| | .__/
#                                                 |___/                                  |_|

#backoffice Security Group
resource "aws_security_group" "live-sg-loadbalancer" {
  name        = "${var.live_vpc-main["env"]}-loadbalancer"
  description = "api backoffice security group"

  lifecycle {
    create_before_destroy = true
  }

  #SSH access from VPC
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "${var.live_vpc-base["cidr_block"]}",
    ]
  }

  #
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = [
      "${var.public_ip}",
    ]
  }

  #HTTPS
  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = [
      "${var.public_ip}",
    ]
  }

  #Logz-io
  ingress {
    from_port = 5015
    to_port   = 5015
    protocol  = "tcp"

    cidr_blocks = [
      "${var.public_ip}",
    ]
  }

  #HTTPS proxy
  ingress {
    from_port = 5443
    to_port   = 5443
    protocol  = "tcp"

    cidr_blocks = [
      "${var.live_vpc-base["cidr_block"]}",
    ]
  }

  #Outbound internet access
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "${var.public_ip}",
    ]
  }

  vpc_id = "${var.live_vpc-main["id"]}"

  tags {
    Name        = "${var.live_vpc-main["env"]}-loadbalancer"
    Environment = "${var.live_vpc-main["env"]}"
  }
}
