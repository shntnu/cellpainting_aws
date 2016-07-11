resource "aws_efs_mount_target" "mount_target_1" {
  file_system_id = "${var.efs_id}"
  subnet_id = "${var.subnet_1_private_id}"
  security_groups = ["${var.nfs_security_group}"]
}

resource "aws_efs_mount_target" "mount_target_2" {
  file_system_id = "${var.efs_id}"
  subnet_id = "${var.subnet_2_private_id}"
  security_groups = ["${var.nfs_security_group}"]
}

