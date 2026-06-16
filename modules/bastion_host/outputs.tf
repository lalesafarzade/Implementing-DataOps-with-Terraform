output "bastion_public_dns" {
  value       = aws_instance.bastion.public_dns
  description = "Public DNS of the Bastion Host"
}

output "rds_endpoint" {
  value       = aws_db_instance.postgres.endpoint
  description = "The connection endpoint for the RDS instance"
}

output "db_password" {
  value       = random_password.db_password.result
  sensitive   = true
}