

resource "aws_instance" "test_instance" {
  ami                    = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type          = "${var.INSTANCE_TYPE}"
  key_name               = "${var.sa_key_name}"
  vpc_security_group_ids = ["${var.sa_security_group_id}"]
  availability_zone      = "${var.AWS_REGION}a"
  count                  = "${var.INSTANCE_NODE_COUNT}"


  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "file" {
    source      = "${var.PATH_TO_SA_PUBLIC_KEY}"
    destination = "/tmp/sa.pub"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }

  connection {
    user        = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }

  tags {
    env-type = "${var.INSTANCE_AWS_TAG}"
  }
}
