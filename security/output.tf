output "security_group_rds_id" {
  value = "${aws_security_group.rds.id}"
}

output "security_group_ssh_http_id" {
  value = "${aws_security_group.ssh_http.id}"
}

output "security_group_nfs_id" {
  value = "${aws_security_group.nfs.id}"
}

