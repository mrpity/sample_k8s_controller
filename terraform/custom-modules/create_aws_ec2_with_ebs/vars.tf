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
  default = "1"
}

variable "INSTANCE_AWS_KEY_PAIR_NAME" {
  default = "test-env"
  
}


variable "INSTANCE_TYPE" {
  default = "t2.micro"
}


variable "ADDITIONAL_EBS_DISK_SIZE" {
  default = 1
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


variable "sa_key_name" {
  default = "sa_key"
}
variable "sa_security_group_id" {
  default = "test-env"  
}

