
#---------------------------------------------------
# MAINTAINER Dmitriy Khodakivsky "d.khodakivsky@whirl.sg"
#---------------------------------------------------

module "aws-custom-security-group" {
    source                              = "../../../custom-modules/create_aws_sec_group"
    AWS_REGION                          = "eu-west-1"

    AWS_ACCESS_KEY                      = "${var.AWS_ACCESS_KEY}"
    AWS_SECRET_KEY                      = "${var.AWS_SECRET_KEY}"

}

module "aws-key-pair" {
    source                              = "../../../custom-modules/create_aws_key_pair"
    AWS_REGION                          = "eu-west-1"

    AWS_ACCESS_KEY                      = "${var.AWS_ACCESS_KEY}"
    AWS_SECRET_KEY                      = "${var.AWS_SECRET_KEY}"

}

module "k8s-cluster-masters" {
    source                              = "../../../custom-modules/create_aws_ec2_with_ebs"
    AWS_REGION                          = "eu-west-1"
    INSTANCE_TYPE                       = "t2.micro"
    sa_security_group_id                =  "${module.aws-custom-security-group.security_group_id}"
    sa_key_name                         =  "${module.aws-key-pair.sa_key_name}"
    
    #----------------------------------------------------------------------------
    # https://aws.amazon.com/ec2/instance-types/
    # t2.micro: 1 CPU (6 credits/hour), 1 GB MEM, 8 GB DISK -- default ($0.0116)
    # c5.xlarge: 4 CPU, 8 GB MEM, 8 GB DISK -- default ($0.1700)
    #----------------------------------------------------------------------------

    INSTANCE_NODE_COUNT                 = "3"

    ADDITIONAL_EBS_DISK_SIZE            = "1"

    AWS_ACCESS_KEY                      = "${var.AWS_ACCESS_KEY}"
    AWS_SECRET_KEY                      = "${var.AWS_SECRET_KEY}"

}

module "k8s-cluster-workers" {
    source                              = "../../../custom-modules/create_aws_ec2_with_ebs"
    AWS_REGION                          = "eu-west-1"
    INSTANCE_TYPE                       = "t2.micro"
    sa_security_group_id                =  "${module.aws-custom-security-group.security_group_id}"
    sa_key_name                         =  "${module.aws-key-pair.sa_key_name}"
    
    #----------------------------------------------------------------------------
    # https://aws.amazon.com/ec2/instance-types/
    # t2.micro: 1 CPU (6 credits/hour), 1 GB MEM, 8 GB DISK -- default ($0.0116)
    # c5.4xlarge: 16 CPU, 32 GB MEM, 8 GB DISK -- default ($0.6800)
    # t3.2xlarge: 8 CPU, 32 GB MEM, 8 GB DISK -- default ($0.3328/hour)
    #----------------------------------------------------------------------------

    INSTANCE_NODE_COUNT                 = "5"

    ADDITIONAL_EBS_DISK_SIZE            = "50"

    AWS_ACCESS_KEY                      = "${var.AWS_ACCESS_KEY}"
    AWS_SECRET_KEY                      = "${var.AWS_SECRET_KEY}"

}