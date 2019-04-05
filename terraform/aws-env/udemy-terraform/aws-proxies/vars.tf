variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "PATH_TO_PRIVATE_KEY" {
  default = "pity"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "pity.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMIS" {
  type = "map"

  default = {
    eu-west-1 = "ami-0204cddbf060b2420"
  }
}

variable "office_ips" {
  type    = "list"
  default = ["46.182.85.2/32", "193.193.201.94/32"]
}

variable "allowed_ports" {
  description = "Allowed ports from/to host"
  type        = "list"
  default     = ["80", "443", "8080", "3128", "8000"]
}
