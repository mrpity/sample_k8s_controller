
resource "aws_ebs_volume" "stage-ebs" {
  availability_zone = "${var.AWS_REGION}"
  size              = 1
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdb"
  volume_id   = "${aws_ebs_volume.stage-ebs.id}"
  instance_id = "${aws_instance.proxy.id}"
}
