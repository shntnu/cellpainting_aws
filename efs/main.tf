resource "aws_efs_file_system" "default" {
  reference_name = "${var.efs_name}"
  tags {
    Name = "${var.efs_name}"
  }
}