# Outputs for AWS Organizations
# Author: Emmanuel Ubani - Cloud & DevOps Engineer

output "organization_id" {
  description = "The ID of the AWS Organization"
  value       = aws_organizations_organization.main.id
}

output "organization_arn" {
  description = "The ARN of the AWS Organization"
  value       = aws_organizations_organization.main.arn
}

output "master_account_id" {
  description = "The ID of the master account"
  value       = aws_organizations_organization.main.master_account_id
}

output "security_ou_id" {
  description = "The ID of the Security OU"
  value       = aws_organizations_organizational_unit.security.id
}

output "workloads_ou_id" {
  description = "The ID of the Workloads OU"
  value       = aws_organizations_organizational_unit.workloads.id
}

output "sandbox_ou_id" {
  description = "The ID of the Sandbox OU"
  value       = aws_organizations_organizational_unit.sandbox.id
}

output "dev_account_id" {
  description = "The ID of the development account"
  value       = aws_organizations_account.dev.id
}

output "prod_account_id" {
  description = "The ID of the production account"
  value       = aws_organizations_account.prod.id
}