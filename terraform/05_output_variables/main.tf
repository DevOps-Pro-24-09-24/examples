provider "aws" {
  region = "us-west-2"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "enable_monitoring" {
  type    = bool
  default = true
}

variable "tags" {
  type = map(string)
  default = {
    Name        = "TerraformInstance"
    Environment = "Dev"
  }
}

variable "security_groups" {
  type = list(string)
  default = ["sg-12345678", "sg-87654321"]
}

variable "instance_details" {
  type = object({
    ami           = string
    instance_type = string
  })
  default = {
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
  }
}

variable "instance_tuple" {
  type = tuple([string, number, bool])
  default = ["ami-0c55b159cbfafe1f0", 1, true]
}

variable "optional_variable" {
  type    = string
  default = null
}

resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = var.instance_details.ami
  instance_type = var.instance_details.instance_type

  monitoring = var.enable_monitoring

  tags = var.tags

  vpc_security_group_ids = var.security_groups
}

output "instance_ids" {
  value = aws_instance.example[*].id
}

