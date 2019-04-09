resource "aws_key_pair" "sa_key" {
  key_name   = "${var.AWS_KEY_NAME}"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}