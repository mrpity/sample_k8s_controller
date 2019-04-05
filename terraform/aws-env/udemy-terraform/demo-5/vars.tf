variable "AWS_REGION" {
  default = "eu-west-1"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-0204cddbf060b2420"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
  }
}


variable "office_ips" {
  type = "list"
  default = ["46.182.85.2/32", "193.193.201.94/32"]
}
