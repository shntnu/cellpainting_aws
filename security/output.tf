output "security_group_default_id" {
  value = "${aws_security_group.default.id}"
}

output "security_group_ssh_http_id" {
  value = "${aws_security_group.ssh_http.id}"
}

