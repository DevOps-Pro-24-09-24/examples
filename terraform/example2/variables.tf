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
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name tag for the instance"
  type        = string
  default     = "example-instance"
}