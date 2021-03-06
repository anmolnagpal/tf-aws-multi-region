###_____    ____   ____
##| ____|  / ___| |___ \
##|  _|   | |       __) |
##| |___  | |___   / __/
##|_____|  \____| |_____|
##

#############################
#        backoffice-AZ-A       #
#############################

resource "aws_instance" "ec2-a" {
  ami                                  = "${var.ami["ubunut16"]}"
  instance_type                        = "${var.ec2-variable["instance_type"]}"
  count                                = "${var.ec2-variable["a_instance_count"]}"
  key_name                             = "${var.key["name"]}"
  instance_initiated_shutdown_behavior = "stop"

  vpc_security_group_ids = [
    "${aws_security_group.ec2-sg.id}",
  ]

  subnet_id                   = "${aws_subnet.subnet-pub-1a.id}"
  associate_public_ip_address = true

  #Volume
  root_block_device {
    volume_type           = "${var.ec2-variable["volume_type"]}"
    volume_size           = "${var.ec2-variable["volume_size"]}"
    delete_on_termination = "${var.ec2-variable["delete_on_termination"]}"
  }

  tags {
    Application = "${var.tags["env"]}-${var.tags["app"]}-${count.index}-a"
    Environment = "${var.tags["env"]}"
    ManagedBy   = "${var.tags["managedby"]}"
  }

  volume_tags {
    Application = "${var.tags["env"]}-${var.tags["app"]}-${count.index}-a"
    Environment = "${var.tags["env"]}"
    ManagedBy   = "${var.tags["managedby"]}"
  }

  lifecycle {
    ignore_changes = [
      "ami",
      "ebs_optimized",
      "source_dest_check",
      "associate_public_ip_address",
      "instance_type",
      "root_block_device.0.delete_on_termination",
    ]
  }
}

#############################
#           AZ-B            #
#############################
resource "aws_instance" "ec2-b" {
  ami                                  = "${var.ami["ubunut16"]}"
  instance_type                        = "${var.ec2-variable["instance_type"]}"
  count                                = "${var.ec2-variable["b_instance_count"]}"
  key_name                             = "${var.key["name"]}"
  instance_initiated_shutdown_behavior = "stop"

  vpc_security_group_ids = [
    "${aws_security_group.ec2-sg.id}",
  ]

  subnet_id = "${aws_subnet.subnet-pub-1a.id}"

  associate_public_ip_address = true

  #Volume
  root_block_device {
    volume_type           = "${var.ec2-variable["volume_type"]}"
    volume_size           = "${var.ec2-variable["volume_size"]}"
    delete_on_termination = "${var.ec2-variable["delete_on_termination"]}"
  }

  tags {
    Application = "${var.tags["env"]}-${var.tags["app"]}-${count.index}-b"
    Environment = "${var.tags["env"]}"
    ManagedBy   = "${var.tags["managedby"]}"
  }

  volume_tags {
    Application = "${var.tags["env"]}-${var.tags["app"]}-${count.index}-b"
    Environment = "${var.tags["env"]}"
    ManagedBy   = "${var.tags["managedby"]}"
  }

  lifecycle {
    ignore_changes = [
      "ami",
      "ebs_optimized",
      "source_dest_check",
      "associate_public_ip_address",
      "instance_type",
      "root_block_device.0.delete_on_termination",
    ]
  }
}
