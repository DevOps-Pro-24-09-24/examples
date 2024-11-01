provider "local" {}

resource "local_file" "example" {
  filename = "${path.module}/example.txt"
  content  = "example for write to local on Terraform."
}

output "example" {
  value = local_file.example.content
  description = "Example output for local file"
  sensitive = true
}