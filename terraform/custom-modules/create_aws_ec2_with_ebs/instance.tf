resource "aws_key_pair" "sa_key" {
  key_name   = "sa_key"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "test_instance" {
  ami                    = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type          = "${var.INSTANCE_TYPE}"
  key_name               = "${aws_key_pair.sa_key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.test-env.id}"]
  count = "${var.INSTANCE_NODE_COUNT}"



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
    work = "test-env"
  }
}
