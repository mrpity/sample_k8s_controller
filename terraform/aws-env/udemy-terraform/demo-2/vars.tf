variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "eu-west-1"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0204cddbf060b2420"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "pity"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "pity.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
