resource "aws_subnet" "subnet_1_private" {
  vpc_id = "${aws_vpc.cellpainting.id}"
  cidr_block = "${var.subnet_1_private_cidr}"
  availability_zone = "${var.az_1}"

  tags {
    Name = "main_subnet1_private"
  }
}

resource "aws_subnet" "subnet_2_private" {
  vpc_id = "${aws_vpc.cellpainting.id}"
  cidr_block = "${var.subnet_2_private_cidr}"
  availability_zone = "${var.az_2}"

  tags {
    Name = "main_subnet2_private"
  }
}

resource "aws_subnet" "subnet_1_public" {
  vpc_id = "${aws_vpc.cellpainting.id}"
  cidr_block = "${var.subnet_1_public_cidr}"
  availability_zone = "${var.az_1}"
  map_public_ip_on_launch = true

  tags {
    Name = "main_subnet1_public"
  }
}
