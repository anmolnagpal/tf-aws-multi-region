terraform {
  required_version = ">= 0.10.3"
}


# Specify the provider and access details
provider "aws" {
  shared_credentials_file = "./../credentials.txt"
  profile                 = "live"
  region                  = "${var.region}"
}


# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "live-internet-gateway" {
  vpc_id = "${aws_vpc.live-vpc-main.id}"

  tags {
    Name        = "${var.live_vpc-base["env"]}-igw"
    Environment = "${var.live_vpc-base["env"]}"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

# Create a VPC to launch our instances into
resource "aws_vpc" "main" {
  cidr_block           = "${var.live_vpc-base["cidr_block"]}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name        = "${var.live_vpc-base["name"]}"
    Environment = "${var.live_vpc-base["env"]}"
    ManagedBy   =  "${var.managed-by}"
  }
}

## keypair for ec2
resource "aws_key_pair" "live-key" {
  key_name   = "${var.live_vpc-base["key_name"]}"
  public_key = "${file("./../../_ssh/dev-instance-key.pub")}"
}





