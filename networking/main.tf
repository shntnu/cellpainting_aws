resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags {
    Name = "${var.vpc_name}"
  }
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
}

# Grant the VPC internet access on its main route table
resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.default.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.default.id}"
}

resource "aws_subnet" "subnet_1_private" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.subnet_1_private_cidr}"
  availability_zone = "${var.az_1}"

  tags {
    Name = "main_subnet1_private"
  }
}

resource "aws_subnet" "subnet_2_private" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.subnet_2_private_cidr}"
  availability_zone = "${var.az_2}"

  tags {
    Name = "main_subnet2_private"
  }
}

resource "aws_subnet" "subnet_1_public" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.subnet_1_public_cidr}"
  availability_zone = "${var.az_1}"
  map_public_ip_on_launch = true

  tags {
    Name = "main_subnet1_public"
  }
}
