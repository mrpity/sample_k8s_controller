data "aws_ip_ranges" "european_ec2" {
  regions = [ "eu-west-1", "eu-central-1" ]
  services = [ "ec2" ]
}


resource "aws_security_group" "from_office" {
 name = "from_office"

  ingress {
    from_port = "0"
    to_port = "0"
    protocol = "tcp"
    cidr_blocks = [ "${var.office_ips}" ]
  }
  tags {
    work = "pity"
  }

}
