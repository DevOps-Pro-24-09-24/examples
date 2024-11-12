variable "ami_id" {
  description = "AMI ID for the instance"
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

variable "vpc_id" {
  description = "VPC ID where the instance will be deployed"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy the instance"
  type        = string
  default     = "us-west-2"
}


module "server" {
  source              = "./server"
  ami_id              = var.ami_id
  subnet_id           = var.subnet_id
  vpc_id              = var.vpc_id
  aws_region          = var.aws_region
  security_group_name = "example-security-group1"

}

module "server2" {
  source              = "./server"
  ami_id              = var.ami_id
  subnet_id           = var.subnet_id
  vpc_id              = var.vpc_id
  aws_region          = var.aws_region
  security_group_name = "example-security-group2"
}