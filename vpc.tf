resource "aws_vpc" "imaging_test" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags {
    Name = "imaging_test"
  }
}
