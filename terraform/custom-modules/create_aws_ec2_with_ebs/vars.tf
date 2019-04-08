variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "PATH_TO_PRIVATE_KEY" {
  default = "admin_user_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "admin_user_key.pub"
}

variable "PATH_TO_SA_PUBLIC_KEY" {
  default = "/home/dkhodakivsky/Documents/ansible2.4.1/ecdsa-wsec-deployment.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "INSTANCE_NODE_COUNT" {
  default = "2"
}

variable "ADDITIONAL_EBS_DISK_SIZE" {
  default = "1"
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
