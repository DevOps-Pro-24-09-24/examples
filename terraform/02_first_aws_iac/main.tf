provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = 3

  tags = {
    Name = "var.instance_name_${count.index}"
  }
}
output "instance_public_ip" {
  value = aws_instance.example[*].public_ip
}

output "instance_id" {
  value = aws_instance.example[*].id
}

output "instance_private_ip" {
  value = aws_instance.example[*].private_ip
}