#Surfaces the final outputs to your terminal window after a successful apply.

output "bastion_host_dns" {
  value       = module.bastion_host.bastion_public_dns
  description = "Connect via SSH to this address"
}

output "database_endpoint" {
  value       = module.bastion_host.rds_endpoint
  description = "Private address of your database instance"
}

output "database_password" {
  value       = module.bastion_host.db_password
  sensitive   = true
  description = "Run 'terraform output database_password' to read"
}