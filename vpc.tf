resource "aws_vpc" "cellpainting" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags {
    Name = "cellpainting"
  }
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "cellpainting" {
  vpc_id = "${aws_vpc.cellpainting.id}"
}

# Grant the VPC internet access on its main route table
resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.cellpainting.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.cellpainting.id}"
}


