resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "proxy" {
  ami                    = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.mykey.key_name}"
  vpc_security_group_ids = ["${aws_security_group.from_office.id}"]
  count = 1

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "file" {
    source      = "/home/dkhodakivsky/Documents/ansible2.4.1/ecdsa-wsec-deployment.pub"
    destination = "/tmp/ecdsa-wsec-deployment.pub"
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
    work = "pity"
  }
}
