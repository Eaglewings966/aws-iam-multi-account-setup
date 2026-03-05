# Outputs for IAM Identity Center
# Author: Emmanuel Ubani - Cloud & DevOps Engineer

output "sso_instance_arn" {
  description = "ARN of the SSO instance"
  value       = local.sso_instance_arn
}

output "identity_store_id" {
  description = "ID of the Identity Store"
  value       = local.identity_store_id
}

output "admin_permission_set_arn" {
  description = "ARN of the Admin permission set"
  value       = aws_ssoadmin_permission_set.admin.arn
}

output "developer_permission_set_arn" {
  description = "ARN of the Developer permission set"
  value       = aws_ssoadmin_permission_set.developer.arn
}

output "readonly_permission_set_arn" {
  description = "ARN of the Read Only permission set"
  value       = aws_ssoadmin_permission_set.readonly.arn
}

output "admin_user_id" {
  description = "ID of the admin user"
  value       = aws_identitystore_user.admin.user_id
}

output "admins_group_id" {
  description = "ID of the Administrators group"
  value       = aws_identitystore_group.admins.group_id
}

output "developers_group_id" {
  description = "ID of the Developers group"
  value       = aws_identitystore_group.developers.group_id
}