output "bastion_host_dns" {
  value       = module.bastion_host.bastion_public_dns
  description = "Connect client terminal directly to this target"
}

output "database_endpoint" {
  value       = module.bastion_host.rds_endpoint
  description = "Private internally routed address of your database node"
}

output "database_password" {
  value       = module.bastion_host.db_password
  sensitive   = true
  description = "Decryption password. View via: terraform output database_password"
}