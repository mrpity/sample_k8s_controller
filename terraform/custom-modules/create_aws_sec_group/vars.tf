variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "eu-west-1"
}
variable "office_ips" {
  type    = "list"
  default = ["46.182.85.2/32", "193.193.201.94/32"]
}

variable "AWS_SECURITY_GROUP_NAME" {
  default = "test-env"
}

variable "INSTANCE_AWS_TAG" {
  default = "pity"
}