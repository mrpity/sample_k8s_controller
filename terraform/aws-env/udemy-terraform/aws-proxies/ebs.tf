resource "aws_ebs_volume" "vol_generic_data" {
  availability_zone = "${var.AWS_REGION}a"
  count             = "${var.INSTANCE_NODE_COUNT}"
  size              = 1
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/xvdb"
  volume_id   = "${element(aws_ebs_volume.vol_generic_data.*.id, count.index)}"
  instance_id = "${element(aws_instance.proxy.*.id, count.index)}"
  count       = "${var.INSTANCE_NODE_COUNT}"
}
