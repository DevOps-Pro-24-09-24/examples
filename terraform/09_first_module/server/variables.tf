variable "aws_region" {
  description = "AWS region to deploy the instance"
  type        = string
  default     = "us-west-2"
}

variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "t2.nano"
}

variable "instance_name" {
  description = "Name tag for the instance"
  type        = string
  default     = "example-instance"
}

variable "vpc_id" {
  description = "VPC ID where the instance will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be deployed"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "example-security-group"
}