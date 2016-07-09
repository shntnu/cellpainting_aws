output "subnet_1_private_id" {
  value = "${aws_subnet.subnet_1_private.id}"
}

output "subnet_2_private_id" {
  value = "${aws_subnet.subnet_2_private.id}"
}

output "subnet_1_public_id" {
  value = "${aws_subnet.subnet_1_public.id}"
}

output "vpc_default_id" {
  value = "${aws_vpc.default.id}"
}