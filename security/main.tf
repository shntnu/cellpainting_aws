resource "aws_security_group" "rds" {
  name = "RDS"
  description = "RDS access"
  vpc_id = "${var.vpc_id}"

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
    Name = "RDS"
  }
}

resource "aws_security_group" "ssh_http" {
  name        = "SSH_HTTP"
  description = "SSH and HTTP access"
  vpc_id      = "${var.vpc_id}"

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

  tags {
    Name = "SSH_HTTP"
  }
}

resource "aws_security_group" "nfs" {
  name        = "NFS"
  description = "NFS access"
  vpc_id      = "${var.vpc_id}"

  # NFS access from anywhere
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "NFS"
  }
}