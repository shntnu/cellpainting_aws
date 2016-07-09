resource "aws_security_group" "default" {
  name = "main_rds_sg"
  description = "Allow all inbound traffic"
  vpc_id = "${aws_vpc.cellpainting.id}"

  ingress {
    from_port = 0
    to_port = 3306
    protocol = "TCP"
    cidr_blocks = ["${var.cidr_blocks}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.sg_name}"
  }
}

resource "aws_security_group" "ssh_http" {
  name        = "SSH_HTTP"
  description = "SSH and HTTP access"
  vpc_id      = "${aws_vpc.cellpainting.id}"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from the VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}