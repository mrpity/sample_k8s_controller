#---------------------------------------------------
# MAINTAINER Dmitriy Khodakivsky "d.khodakivsky@whirl.sg"
#---------------------------------------------------

module "aws-custom-security-group" {
  source     = "../../../custom-modules/create_aws_sec_group"
  AWS_REGION = "eu-west-1"

  AWS_SECURITY_GROUP_NAME = "ololo"

  AWS_ACCESS_KEY = "${var.AWS_ACCESS_KEY}"
  AWS_SECRET_KEY = "${var.AWS_SECRET_KEY}"
}

module "aws-key-pair" {
  source     = "../../../custom-modules/create_aws_key_pair"
  AWS_REGION = "eu-west-1"

  AWS_KEY_NAME = "ololo"

  AWS_ACCESS_KEY = "${var.AWS_ACCESS_KEY}"
  AWS_SECRET_KEY = "${var.AWS_SECRET_KEY}"
}

module "deploy-instance" {
    source                              = "../../../custom-modules/create_aws_ec2_with_ebs"
    AWS_REGION                          = "eu-west-1"
    INSTANCE_TYPE                       = "t2.micro"
    sa_security_group_id                =  "${module.aws-custom-security-group.security_group_id}"
    sa_key_name                         =  "${module.aws-key-pair.sa_key_name}"
    INSTANCE_AWS_TAG                    = "deploy-instance"


    #----------------------------------------------------------------------------
    # https://aws.amazon.com/ec2/instance-types/
    # t2.micro: 1 CPU (6 credits/hour), 1 GB MEM, 8 GB DISK -- default ($0.0116)
    # c5.xlarge: 4 CPU, 8 GB MEM, 8 GB DISK -- default ($0.1700)
    #----------------------------------------------------------------------------


    INSTANCE_NODE_COUNT                 = "1"

    ROOT_VOLUME_SIZE                    = "15"
    ADDITIONAL_EBS_DISK_SIZE            = "1"


    AWS_ACCESS_KEY                      = "${var.AWS_ACCESS_KEY}"
    AWS_SECRET_KEY                      = "${var.AWS_SECRET_KEY}"


}

