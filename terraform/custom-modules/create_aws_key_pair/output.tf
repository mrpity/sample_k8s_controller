# Output the IDs of the EC2 instances created
output "sa_key_name" {
    value = "${aws_key_pair.sa_key.key_name}"
}
