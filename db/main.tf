resource "aws_db_instance" "default" {
  identifier              = "${var.identifier}"
  allocated_storage       = "${var.storage}"
  engine                  = "${var.engine}"
  engine_version          = "${lookup(var.engine_version, var.engine)}"
  instance_class          = "${var.instance_class}"
  name                    = "${var.db_name}"
  username                = "${var.db_username}"
  password                = "${var.db_password}"
  vpc_security_group_ids  = ["${var.security_group_id}"]
  db_subnet_group_name    = "${aws_db_subnet_group.default.id}"
}

resource "aws_db_subnet_group" "default" {
  name                    = "main_subnet_group"
  description             = "Our main group of subnets"
  subnet_ids              = ["${subnet_1_private_id}", "${subnet_2_private_id}"]
}


