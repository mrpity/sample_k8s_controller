
#---------------------------------------------------
# MAINTAINER Dmitriy Khodakivsky "d.khodakivsky@whirl.sg"
#---------------------------------------------------
module "ceph-media" {
    source                              = "../../../custom-modules/create_aws_ec2_with_ebs"
    AWS_REGION                          = "eu-west-1"
    INSTANCE_TYPE                       = "t2.micro"
    
    #-----------------------------------------------
    # https://aws.amazon.com/ec2/instance-types/
    # t2.micro: 1 CPU, 1 GB MEM, 8 GB DISK -- default
    #-----------------------------------------------

    INSTANCE_NODE_COUNT                 = "2"

    ADDITIONAL_EBS_DISK_SIZE            = "1"

    AWS_ACCESS_KEY                      = "${var.AWS_ACCESS_KEY}"
    AWS_SECRET_KEY                      = "${var.AWS_SECRET_KEY}"

}

