# Output the IDs of the EC2 instances created
output "instance_ids" {
    value = ["${aws_instance.proxy.*.id}"]
}

output "availability_zone" {
  description = "List of availability zones of instances"
  value       = ["${aws_instance.proxy.*.availability_zone}"]
}

output "proxies_public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = ["${aws_instance.proxy.*.public_ip}"]
}

output "proxies_public_dns" {
  description = "List of public DNS addresses assigned to the instances, if applicable"
  value       = ["${aws_instance.proxy.*.public_dns}"]
}

output "proxies_private_ip" {
  description = "List of private IP addresses assigned to the instances, if applicable"
  value       = ["${aws_instance.proxy.*.private_ip}"]
}

output "proxies_private_dns" {
  description = "List of private DNS addresses assigned to the instances, if applicable"
  value       = ["${aws_instance.proxy.*.private_dns}"]
}

output "proxy_port" {
  description = "Static value of proxy port"
  value       = ["3128"]
}

output "security_groups" {
  description = "List of associated security groups of instances"
  value       = "${aws_instance.proxy.*.security_groups}"
}
