output "bastion_public_dns" {
  value       = aws_instance.bastion.public_dns
  description = "Public network footprint of the Bastion server"
}

output "rds_endpoint" {
  value       = aws_db_instance.postgres.endpoint
  description = "Private routing destination of the database engine instance"
}

output "db_password" {
  value       = random_password.db_password.result
  sensitive   = true
}