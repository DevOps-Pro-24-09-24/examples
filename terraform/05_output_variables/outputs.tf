

output "instance_public_ips" {
  description = "Public IPs of the created instances"
  value       = aws_instance.example[*].public_ip
}