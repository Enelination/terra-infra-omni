output "application_ips" {
  value = aws_instance.app[*].public_ip
}
