variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "admin_user_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "admin_user_key.pub"
}

variable "AWS_KEY_NAME" {
  default = "sa_key"
}
