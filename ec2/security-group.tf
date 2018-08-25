##____                                 _   _                ____
#/ ___|    ___    ___   _   _   _ __  (_) | |_   _   _     / ___|  _ __    ___    _   _   _ __
#\___ \   / _ \  / __| | | | | | '__| | | | __| | | | |   | |  _  | '__|  / _ \  | | | | | '_ \
##___) | |  __/ | (__  | |_| | | |    | | | |_  | |_| |   | |_| | | |    | (_) | | |_| | | |_) |
#|____/   \___|  \___|  \__,_| |_|    |_|  \__|  \__, |    \____| |_|     \___/   \__,_| | .__/
#                                                 |___/                                  |_|

#backoffice Security Group
resource "aws_security_group" "ec2-sg" {
  name        = "${var.live_vpc-main["env"]}-${var.tags[app]}"
  description = " ${var.tags[app]} security group"

  lifecycle {
    create_before_destroy = true
  }

  #SSH access from VPC
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "${var.public-ip}",
    ]
  }

  #Outbound internet access
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = "0.0.0.0/0"
  }

  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Application = "${var.tags["env"]}-${var.tags["app"]}-${count.index}-sg"
    Environment = "${var.tags["env"]}"
    ManagedBy   = "${var.tags["managedby"]}"
  }
}
