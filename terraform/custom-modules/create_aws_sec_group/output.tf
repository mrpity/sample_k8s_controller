# Output the IDs of the EC2 instances created
output "security_group_id" {
    value = "${aws_security_group.test-env.id}"
}
