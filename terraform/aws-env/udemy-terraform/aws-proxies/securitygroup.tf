#---------------------------------------------------
# Create security group
#---------------------------------------------------
resource "aws_security_group" "from_office" {
  name        = "from_office"
  description = "Allow all inbound traffic from office and DC"

  # allow traffic for TCP 22
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.office_ips}"]
  }

  # allow traffic from  host
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    work = "pity"
  }
}

#---------------------------------------------------
# Add security group rules (one more way)
#---------------------------------------------------
resource "aws_security_group_rule" "ingress_ports" {
  type              = "ingress"
  count             = "${length(var.allowed_ports)}"
  security_group_id = "${aws_security_group.from_office.id}"
  from_port         = "${element(var.allowed_ports, count.index)}"
  to_port           = "${element(var.allowed_ports, count.index)}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ingress_default_aws" {
  type              = "ingress"
  security_group_id = "${aws_security_group.from_office.id}"
  from_port   	    = 0
  to_port     	    = 0
  protocol          = "-1"
  cidr_blocks       = ["172.31.0.0/16"]
}
