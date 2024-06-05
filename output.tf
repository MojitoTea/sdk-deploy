# ------------------------------------------------------------------------------
# OUTPUT NETWORK
# ------------------------------------------------------------------------------
output "vpc_id" {
  description = "ID VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs публічних підмереж VPC"
  value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "IDs приватних підмереж VPC"
  value       = module.vpc.private_subnets
}

output "database_subnet_ids" {
  description = "IDs підмереж для баз даних"
  value       = module.vpc.database_subnets
}
