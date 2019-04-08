resource "aws_key_pair" "sa_key" {
  key_name   = "sa_key"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}