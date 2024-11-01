variable "aws_region" {
  description = "AWS region to deploy the resources"
  type        = string
  default     = "us-west-2"
}

variable "ami_id" {
  description = "AMI ID for the instances"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the resources will be deployed"
  type        = string
}

variable "alb_name" {
  description = "Name of the ALB"
  type        = string
  default     = "example-alb"
}

variable "alb_security_group_name" {
  description = "Name of the security group for ALB"
  type        = string
  default     = "example-alb-sg"
}

variable "instance_security_group_name" {
  description = "Name of the security group for EC2 instances"
  type        = string
  default     = "example-instance-sg"
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
  default     = "example-tg"
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate"
  type        = string
}

variable "route53_zone_id" {
  description = "Route 53 Hosted Zone ID"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the ALB"
  type        = string
}

variable "user_data_file" {
  description = "Path to the user data script file"
  type        = string
}

variable "subnet_id_1" {
  description = "The first subnet ID for the ALB"
  type        = string
}

variable "subnet_id_2" {
  description = "The second subnet ID for the ALB"
  type        = string
}
