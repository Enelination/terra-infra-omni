output "database_ips" {
  value = aws_instance.db[*].public_ip
}
