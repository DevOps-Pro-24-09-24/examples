aws_region                   = "eu-central-1"
ami_id                       = "ami-08ec94f928cf25a9d"
vpc_id                       = "vpc-04c621ff2332354cf"
alb_name                     = "demo-alb"
alb_security_group_name      = "demo-alb-sg"
instance_security_group_name = "demo-instance-sg"
target_group_name            = "demo-tg"
certificate_arn              = "arn:aws:acm:eu-central-1:739775455648:certificate/67ad6e1b-520e-4f43-9750-d0bca4d45481"
route53_zone_id              = "Z0803072367RY3QP3TTZL"
domain_name                  = "oneclickaway.click"
user_data_file               = "user-data.sh"
subnet_id_1                  = "subnet-06d221cb1471fds7d"
subnet_id_2                  = "subnet-0df65d787159dzf7d"