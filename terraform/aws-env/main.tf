#
# MAINTAINER Dmitriy Khodakivsky "d.khodakivsky@whirl.sg"
#
terraform {
  required_version = ">= 0.11.13"
}

provider "aws" {
    region  = "us-east-1"
    profile = "default"
}

module "ec2" {
    source                              = "../custom-modules/aws/ec2"
    name                                = "TEST-Machine"
    region                              = "us-east-1"
    environment                         = "STAGE"
    ec2_instance_type                   = "t2.micro"
    enable_associate_public_ip_address  = "true"
    disk_size                           = "8"
    #tenancy                             = "${module.vpc.instance_tenancy}"
    #iam_instance_profile                = "${module.iam.instance_profile_id}"
    #subnet_id                           = "${element(module.vpc.vpc-publicsubnet-ids, 0)}"
    #subnet_id                           = "${element(module.vpc.vpc-privatesubnet-ids, 0)}"
    #subnet_id                           = ["${element(module.vpc.vpc-privatesubnet-ids)}"]
    #vpc_security_group_ids              = ["${module.vpc.security_group_id}"]

    monitoring                          = "false"
}

