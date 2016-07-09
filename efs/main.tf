resource "aws_efs_file_system" "default" {
  reference_name = "${var.efs_name}"
  tags {
    Name = "${var.efs_name}"
  }
}

resource "aws_efs_mount_target" "mount_target_1" {
  file_system_id = "${aws_efs_file_system.default.id}"
  subnet_id = "${var.subnet_1_private_id}"
  security_groups = ["${var.nfs_security_group}"]
}

resource "aws_efs_mount_target" "mount_target_2" {
  file_system_id = "${aws_efs_file_system.default.id}"
  subnet_id = "${var.subnet_2_private_id}"
  security_groups = ["${var.nfs_security_group}"]
}

